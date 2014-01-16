subject = null
element = jQuery("<div>
  <canvas id='fakeCanvas'></canvas>
</div>")
fakeResponse = {'1.9.3': 10, '2.0.0': 5}
chartLineStub = sinon.spy()

describe "Loaad Results Chart", ->
  beforeEach ->
    sinon.stub(jQuery, "ajax").yieldsTo("success", fakeResponse)
    sinon.stub(window, "Chart").returns
      Line: chartLineStub

    jQuery('body').append(element)
    subject = new RubyBench.LoadResultsChart(1, 2, 'canvas#fakeCanvas')

  afterEach ->
    jQuery.ajax.restore()
    window.Chart.restore()
    element.remove()

  it "runs", ->
    subject.run()
    expect(jQuery.ajax.calledOnce).toEqual(true)

    ajax_call = jQuery.ajax.getCall(0)
    expect(ajax_call.args[0].url).toEqual('/api/results/2')
    expect(ajax_call.args[0].dataType).toEqual('json')
    expect(ajax_call.args[0].params).toEqual({runner_id: 1})

    expect(Chart.calledWithNew()).toEqual(true)
    expect(chartLineStub.calledWith({
      labels: ['1.9.3', '2.0.0'],
      datasets: [{
        fillColor: "rgba(151,187,205,0.5)"
        strokeColor: "rgba(151,187,205,1)"
        pointColor: "rgba(151,187,205,1)"
        pointStrokeColor: "#fff"
        data: [10, 5]
      }]
    }, {bezierCurve: false})).toEqual(true)
