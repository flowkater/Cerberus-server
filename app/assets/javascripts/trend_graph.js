$(document).ready(function () {
    var memory_data = [
        {
            "xScale":"ordinal",
            "type":"line-dotted",
            "yScale":"linear",
            "main":[
                {
                    "className":".memory",
                    "data":[
                        { "y":15, "x":"2012-11-19T00:00:00" },
                        { "y":11, "x":"2012-11-20T00:00:00" },
                        { "y":8, "x":"2012-11-21T00:00:00" },
                        { "y":10, "x":"2012-11-22T00:00:00" },
                        { "y":1, "x":"2012-11-23T00:00:00" },
                        { "y":6, "x":"2012-11-24T00:00:00" },
                        { "y":8, "x":"2012-11-25T00:00:00" }
                    ]
                }
            ]
        }
    ];

    var cpu_data = [
        {
            "xScale":"ordinal",
            "type":"line-dotted",
            "yScale":"linear",
            "main":[
                {
                    "className":".cpu",
                    "data":[
                        { "y":15, "x":"2012-11-19T00:00:00" },
                        { "y":11, "x":"2012-11-20T00:00:00" },
                        { "y":8, "x":"2012-11-21T00:00:00" },
                        { "y":10, "x":"2012-11-22T00:00:00" },
                        { "y":1, "x":"2012-11-23T00:00:00" },
                        { "y":6, "x":"2012-11-24T00:00:00" },
                        { "y":8, "x":"2012-11-25T00:00:00" }
                    ]
                }
            ]
        }
    ];

    var network_data = [
        {
            "xScale":"ordinal",
            "type":"line-dotted",
            "yScale":"linear",
            "main":[
                {
                    "className":".network",
                    "data":[
                        { "y":15, "x":"2012-11-19T00:00:00" },
                        { "y":11, "x":"2012-11-19T22:00:00" },
                        { "y":8, "x":"2012-11-19T24:00:00" },
                        { "y":10, "x":"2012-11-20T00:00:00" },
                        { "y":1, "x":"2012-11-20T06:00:00" },
                        { "y":6, "x":"2012-11-24T00:00:00" },
                        { "y":8, "x":"2012-11-25T00:00:00" }
                    ]
                }
            ]
        }
    ];

    var battery_data = [
        {
            "xScale":"ordinal",
            "type":"line-dotted",
            "yScale":"linear",
            "main":[
                {
                    "className":".battery",
                    "data":[
                        { "y":15, "x":"2012-11-19T00:00:00" },
                        { "y":11, "x":"2012-11-20T00:00:00" },
                        { "y":8, "x":"2012-11-21T00:00:00" },
                        { "y":10, "x":"2012-11-22T00:00:00" },
                        { "y":1, "x":"2012-11-23T00:00:00" },
                        { "y":6, "x":"2012-11-24T00:00:00" },
                        { "y":8, "x":"2012-11-25T00:00:00" }
                    ]
                }
            ]
        }
    ];

    var order = [0, 1, 0, 2],
        i = 0,
        xFormat = d3.time.format('%A'),
        chart;

    if ($("#memory-trend-graph").length > 0) {
        chart = new xChart('bar', memory_data[order[i]], '#memory-trend-graph', {
            axisPaddingTop: 5,
            paddingLeft: 30,
            dataFormatX: function (x) { return new Date(x); },
            tickFormatX: function (x) { return d3.time.format('%a')(x); }
        });
    }

    if ($("#cpu-trend-graph").length > 0) {
        chart = new xChart('bar', cpu_data[order[i]], '#cpu-trend-graph', {
            axisPaddingTop: 5,
            paddingLeft: 30,
            dataFormatX: function (x) { return new Date(x); },
            tickFormatX: function (x) { return d3.time.format('%a')(x); }
        });
    }

    if ($("#network-trend-graph").length > 0) {
        chart = new xChart('bar', network_data[order[i]], '#network-trend-graph', {
            axisPaddingTop: 5,
            paddingLeft: 30,
            dataFormatX: function (x) { return new Date(x); },
            tickFormatX: function (x) { return d3.time.format('%a')(x); }
        });
    }

    if ($("#battery-trend-graph").length > 0) {
        chart = new xChart('bar', battery_data[order[i]], '#battery-trend-graph', {
            axisPaddingTop: 5,
            paddingLeft: 30,
            dataFormatX: function (x) { return new Date(x); },
            tickFormatX: function (x) { return d3.time.format('%a')(x); }
        });
    }

});