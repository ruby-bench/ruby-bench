class RubyBench.LoadResultsChart
  constructor: (@runner, @benchmark, @element_tag) ->

  element: ->
    document.querySelector(@element_tag)

  context: ->
    @element().getContext('2d')

  options: ->
    {bezierCurve: false}

  run: ->
    jQuery.ajax
      url: "/api/results/#{@benchmark}"
      params:
        runner_id: @runner
      dataType: 'json'
      success: (data) =>
        params =
          labels: Object.keys(data)
          datasets: [
            fillColor: "rgba(151,187,205,0.5)"
            strokeColor: "rgba(151,187,205,1)"
            pointColor: "rgba(151,187,205,1)"
            pointStrokeColor: "#fff"
            data: jQuery.map data, (v) -> v
          ]

        new Chart(@context()).Line params, @options()
