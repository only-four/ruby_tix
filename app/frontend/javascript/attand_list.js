document.addEventListener('DOMContentLoaded', function(){

  var ctx = document.getElementById('js-myChart');
  var count = ctx.dataset.id
  console.log(count);
  var myChart = new Chart(ctx, {
    type: 'doughnut',
      data: {
          labels: [],
          datasets: [{
              label: '# of Votes',
              data: [count,90],
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)', 
              ],
              borderColor: [
                'rgba(54, 162, 235, 0.2)',
              ],
              borderWidth: 1
          }]
      },
      options: {
        // responsive: true,
        // maintainAspectRatio: false,
        // cutoutPercentage: 80,
      }
  });

  var soldChart = document.getElementById('js-soldChart');
  var count = soldChart.dataset.id
  console.log(count);
  var myChart = new Chart(soldChart, {
    type: 'doughnut',
      data: {
          labels: ['目前參加比例：'],
          datasets: [{
              label: '# of Votes',
              data: [90,90],
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)', 
              ],
              borderColor: [
                'rgba(54, 162, 235, 0.2)',
              ],
              borderWidth: 1
          }]
      }
  });
})