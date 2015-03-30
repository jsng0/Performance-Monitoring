$(function() {

var day_data = [
{period: '2015-02-24 17:00',user1: 23,user2: 50,user3: 10,user4: 9},
{period: '2015-02-24 17:15',user1: 12,user2: 62,user3: 17,user4: 30},
{period: '2015-02-24 17:30',user1: 10,user2: 10,user3: 10,user4: 10},
{period: '2015-02-24 17:45',user1: 68,user2: 12,user3: 85,user4:5},
{period: '2015-02-24 18:00',user1: 60,user2: 56,user3: 10,user4: 90}
];

    Morris.Line({
        element: 'morris-area-chart',
        data: day_data,
	ymax: 100,
	ymin: 0,
        xkey: 'period',
	xLabels: "minute",
        ykeys: ['user1', 'user2', 'user3', 'user4'],
        labels: ['User1', 'User2', 'User3', 'User4'],
	lineColors: ['#428bca', '#51A351', '#ffc40d', '#d9534f'],
        pointSize: 2,
        hideHover: 'true',
        resize: true
    });

});
