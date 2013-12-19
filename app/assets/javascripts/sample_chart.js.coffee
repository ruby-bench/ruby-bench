$ ->
  data =
    labels: ["1.8.6","1.8.7","1.9.1","1.9.2","1.9.3","2.0.0","2.1.0"]
    datasets: [{
      fillColor: "rgba(151,187,205,0.5)"
      strokeColor: "rgba(151,187,205,1)"
      pointColor: "rgba(151,187,205,1)"
      pointStrokeColor: "#fff"
      data: [98, 93, 90, 60, 40, 25, 16]
    }]

  options =
    bezierCurve: false

  line = new Chart($("#chart")[0].getContext('2d')).Line(data, options)