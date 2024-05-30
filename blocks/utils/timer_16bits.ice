{
  "version": "1.2",
  "package": {
    "name": "timer_16bits",
    "version": "1.1",
    "description": "measure time by counting clk periods between start and stop pulse",
    "author": "Sicco Dwars",
    "image": ""
  },
  "design": {
    "board": "iCEBreaker",
    "graph": {
      "blocks": [
        {
          "id": "f872dbf6-a8bc-43e0-946e-bbb877972f87",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "clock": false,
            "virtual": true
          },
          "position": {
            "x": 16,
            "y": 152
          }
        },
        {
          "id": "c82fe5a1-a7ac-46e2-9ba4-223ffc59c94a",
          "type": "basic.output",
          "data": {
            "name": "started",
            "virtual": true
          },
          "position": {
            "x": 1048,
            "y": 192
          }
        },
        {
          "id": "3451bc76-8868-4317-a6fc-effb423a1ca3",
          "type": "basic.input",
          "data": {
            "name": "start",
            "clock": false,
            "virtual": true
          },
          "position": {
            "x": 16,
            "y": 312
          }
        },
        {
          "id": "1fe02d66-fdff-40a8-acac-16140eeab328",
          "type": "basic.output",
          "data": {
            "name": "time",
            "range": "[15:0]",
            "size": 16,
            "virtual": true
          },
          "position": {
            "x": 1056,
            "y": 432
          }
        },
        {
          "id": "5ebe452e-2418-415e-aa28-4492100e66a4",
          "type": "basic.input",
          "data": {
            "name": "stop",
            "clock": false,
            "virtual": true
          },
          "position": {
            "x": 16,
            "y": 472
          }
        },
        {
          "id": "d5d8f7b2-c690-45fc-a3fa-6a789817784b",
          "type": "basic.code",
          "data": {
            "code": "reg [15:0] counter = 0;\nreg [15:0] t_start = 0;\nreg [15:0] duration_i = 0;\nassign duration = duration_i;\nreg started_i = 0;\nassign started = started_i;\nreg prev_start = 0;\nreg prev_stop = 0;\n\nalways @(posedge clk)\nbegin\n    if (start && !prev_start)\n         t_start <= counter;\n    if (stop && !prev_stop)\n         duration_i <= counter - t_start;\n \n    counter <= counter + 1'b1;\n\n    prev_start <= start;\n    prev_stop <= stop;\n\nend",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "start"
                },
                {
                  "name": "stop"
                }
              ],
              "out": [
                {
                  "name": "started"
                },
                {
                  "name": "duration",
                  "range": "[15:0]",
                  "size": 16
                }
              ]
            }
          },
          "position": {
            "x": 240,
            "y": 104
          },
          "size": {
            "width": 672,
            "height": 480
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "d5d8f7b2-c690-45fc-a3fa-6a789817784b",
            "port": "duration"
          },
          "target": {
            "block": "1fe02d66-fdff-40a8-acac-16140eeab328",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "3451bc76-8868-4317-a6fc-effb423a1ca3",
            "port": "out"
          },
          "target": {
            "block": "d5d8f7b2-c690-45fc-a3fa-6a789817784b",
            "port": "start"
          }
        },
        {
          "source": {
            "block": "5ebe452e-2418-415e-aa28-4492100e66a4",
            "port": "out"
          },
          "target": {
            "block": "d5d8f7b2-c690-45fc-a3fa-6a789817784b",
            "port": "stop"
          }
        },
        {
          "source": {
            "block": "d5d8f7b2-c690-45fc-a3fa-6a789817784b",
            "port": "started"
          },
          "target": {
            "block": "c82fe5a1-a7ac-46e2-9ba4-223ffc59c94a",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "f872dbf6-a8bc-43e0-946e-bbb877972f87",
            "port": "out"
          },
          "target": {
            "block": "d5d8f7b2-c690-45fc-a3fa-6a789817784b",
            "port": "clk"
          }
        }
      ]
    }
  },
  "dependencies": {}
}