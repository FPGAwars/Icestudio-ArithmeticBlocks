{
  "version": "1.2",
  "package": {
    "name": "div_int16",
    "version": "1.1",
    "description": "16 bits signed integer divider",
    "author": "",
    "image": "%3Csvg%20width=%22800%22%20height=%22600%22%20xmlns=%22http://www.w3.org/2000/svg%22%3E%3Ctitle%3ELayer%201%3C/title%3E%3Ctext%20fill=%22#46673D%22%20stroke-width=%220%22%20x=%22144.046%22%20y=%22175.088%22%20font-size=%2224%22%20font-family=%22sans-serif%22%20stroke=%22#000%22%20transform=%22matrix(10.7248%200%200%2014.8192%20-1369.09%20-2211.12)%22%3EDIV%3C/text%3E%3Ctext%20stroke-width=%220%22%20x=%22407.223%22%20y=%22473.289%22%20font-size=%2224%22%20font-family=%22sans-serif%22%20stroke=%22#000%22%20transform=%22matrix(6.02479%200%200%203.13937%20-2290.17%20-952.151)%22%20cursor=%22text%22%3Eint_16%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%2299%22%20x=%2260%22%20stroke-width=%220%22%20stroke=%22#000%22%3ECLK%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22238%22%20x=%2220%22%20stroke-width=%220%22%20stroke=%22#000%22%3Estart%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22345%22%20x=%2227%22%20stroke-width=%220%22%20stroke=%22#000%22%20cursor=%22move%22%3EX%3C/text%3E%3Cpath%20stroke-width=%224%22%20stroke=%22#000%22%20fill=%22none%22%20d=%22M-1%2049l42%2039M41%2090l-43%2036%22/%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22468%22%20x=%2226%22%20stroke-width=%220%22%20stroke=%22#000%22%3EY%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22170%22%20x=%22710%22%20stroke-width=%220%22%20stroke=%22#000%22%3EBUSY%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22249%22%20x=%22710%22%20stroke-width=%220%22%20stroke=%22#000%22%3EVALID%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22326%22%20x=%22727%22%20stroke-width=%220%22%20stroke=%22#000%22%3Edbz%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22421%22%20x=%22734%22%20stroke-width=%220%22%20stroke=%22#000%22%3Eq%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22499%22%20x=%22734%22%20stroke-width=%220%22%20stroke=%22#000%22%3Er%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%2272%22%20x=%22708%22%20stroke-width=%220%22%20stroke=%22#000%22%3EDONE%3C/text%3E%3Cpath%20stroke=%22#000%22%20fill=%22none%22%20d=%22M638%2094h40M679%2062v29M694%2063l-14-1M693%2095V65M772%2095h-81M683%20363v-4M800%20601l18%2025%22/%3E%3C/svg%3E"
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "b594bd8c-4263-4b91-9aa3-591541041457",
          "type": "basic.output",
          "data": {
            "name": "done"
          },
          "position": {
            "x": 1608,
            "y": 136
          }
        },
        {
          "id": "c52eb53f-45ba-4dc2-a1ed-3471922053c3",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "clock": false
          },
          "position": {
            "x": 304,
            "y": 160
          }
        },
        {
          "id": "77545349-454a-4d5f-82e6-a8b1f6261f26",
          "type": "basic.output",
          "data": {
            "name": "busy"
          },
          "position": {
            "x": 1592,
            "y": 256
          }
        },
        {
          "id": "008bc8ae-2c14-480d-ad2a-b595e21d6980",
          "type": "basic.input",
          "data": {
            "name": "start",
            "clock": false
          },
          "position": {
            "x": 296,
            "y": 344
          }
        },
        {
          "id": "fb0d9a68-cf3f-4768-b540-483468429470",
          "type": "basic.output",
          "data": {
            "name": "valid"
          },
          "position": {
            "x": 1592,
            "y": 376
          }
        },
        {
          "id": "2cf01ed6-9923-4eee-9fd0-1c9c9ca24346",
          "type": "basic.output",
          "data": {
            "name": "dbz"
          },
          "position": {
            "x": 1592,
            "y": 496
          }
        },
        {
          "id": "35d7e28a-1c9c-4460-8f01-efbfef5cb6fd",
          "type": "basic.input",
          "data": {
            "name": "x",
            "range": "[15:0]",
            "clock": false,
            "size": 16
          },
          "position": {
            "x": 296,
            "y": 528
          }
        },
        {
          "id": "9824919f-2433-48fc-ab1b-be881b669920",
          "type": "basic.output",
          "data": {
            "name": "q",
            "range": "[15:0]",
            "size": 16
          },
          "position": {
            "x": 1608,
            "y": 616
          }
        },
        {
          "id": "5e264525-0798-4e4f-9ea4-d2ef25055a03",
          "type": "basic.input",
          "data": {
            "name": "y",
            "range": "[15:0]",
            "clock": false,
            "size": 16
          },
          "position": {
            "x": 296,
            "y": 712
          }
        },
        {
          "id": "f036a77e-5138-429f-bfbe-f7d323b1ee57",
          "type": "basic.output",
          "data": {
            "name": "r",
            "range": "[15:0]",
            "size": 16
          },
          "position": {
            "x": 1608,
            "y": 736
          }
        },
        {
          "id": "396814a2-9764-4311-96f8-10d766e29af3",
          "type": "basic.code",
          "data": {
            "code": "localparam WIDTH = 16;\r\n\r\nwire [WIDTH-1:0] xw;\r\nwire [WIDTH-1:0] yw;\r\n\r\nreg [WIDTH-1:0] y1;\r\nreg [WIDTH-1:0] q1;\r\nreg [WIDTH-1:0] q1_next;\r\nreg [WIDTH:0] ac;\r\nreg [WIDTH:0] ac_next;\r\nreg [$clog2(WIDTH)-1:0] i;\r\n\r\nreg pulse_done_i = 0;\r\nassign pulse_done = pulse_done_i;\r\nreg busy_i = 0;\r\nassign busy = busy_i;\r\nreg valid_i = 0;\r\nassign valid = valid_i;\r\nreg dbz_i = 0;\r\nassign dbz = dbz_i;\r\nreg signed [WIDTH-1:0] q_i = 0;\r\nassign q = q_i;\r\nreg [WIDTH-1:0] r_i = 0;\r\nassign r = r_i;\r\nreg qs;\r\nreg xs;\r\n\r\nreg prev_start = 0;\r\n\r\nwire [WIDTH:0] ac_nextw;\r\n\r\nassign ac_nextw = ac - y1;\r\n\r\nassign xw = (x[WIDTH-1]) ? (~x + 1) : x;\r\nassign yw = (y[WIDTH-1]) ? (~y + 1) : y;\r\n\r\nalways @(negedge clk) \r\nbegin\r\n    if (ac >= {1'b0,y1}) \r\n        {ac_next, q1_next} <= {ac_nextw[WIDTH-1:0], q1, 1'b1};\r\n    else \r\n        {ac_next, q1_next} <= {ac, q1} << 1;\r\nend\r\n\r\nalways @(posedge clk) \r\nbegin\r\n    prev_start <= start;\r\n    if (start && !prev_start) \r\n    begin\r\n        valid_i <= 0;\r\n        i <= 0;\r\n        if (y == 0) // divide by 0? \r\n        begin\r\n            if (x == 0)\r\n                q_i <= 0;\r\n            else\r\n                q_i <= {WIDTH{1'b1}};\r\n            r_i <= 0;\r\n            pulse_done_i <= 1;\r\n            busy_i <= 0;\r\n            dbz_i <= 1;\r\n        end \r\n        else \r\n        begin\r\n            busy_i <= 1;\r\n            dbz_i <= 0;\r\n            y1 <= yw;\r\n            {ac, q1} <= {{WIDTH{1'b0}}, xw, 1'b0};\r\n            qs <= x[WIDTH-1] ^ y[WIDTH-1];\r\n            xs <= x[WIDTH-1];\r\n        end\r\n    end \r\n    else \r\n        if (busy) \r\n        begin\r\n            if (i == WIDTH-1) \r\n            begin\r\n                busy_i <= 0;\r\n                valid_i <= 1;\r\n                if (qs)\r\n                    q_i <= ~q1_next + 1;\r\n                else\r\n                    q_i <= q1_next;\r\n                if (xs)\r\n                    r_i <= ~ac_next[WIDTH:1] + 1;\r\n                else\r\n                    r_i <= ac_next[WIDTH:1];\r\n                pulse_done_i <= 1;\r\n            end \r\n            else \r\n            begin\r\n                i <= i + 1;\r\n                ac <= ac_next;\r\n                q1 <= q1_next;\r\n            end\r\n        end\r\n        else\r\n        begin\r\n            pulse_done_i <= 0;\r\n        end\r\nend\r\n",
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
                  "name": "x",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "y",
                  "range": "[15:0]",
                  "size": 16
                }
              ],
              "out": [
                {
                  "name": "pulse_done"
                },
                {
                  "name": "busy"
                },
                {
                  "name": "valid"
                },
                {
                  "name": "dbz"
                },
                {
                  "name": "q",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "r",
                  "range": "[15:0]",
                  "size": 16
                }
              ]
            }
          },
          "position": {
            "x": 488,
            "y": 104
          },
          "size": {
            "width": 1032,
            "height": 728
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "008bc8ae-2c14-480d-ad2a-b595e21d6980",
            "port": "out"
          },
          "target": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "start"
          }
        },
        {
          "source": {
            "block": "c52eb53f-45ba-4dc2-a1ed-3471922053c3",
            "port": "out"
          },
          "target": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "busy"
          },
          "target": {
            "block": "77545349-454a-4d5f-82e6-a8b1f6261f26",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "valid"
          },
          "target": {
            "block": "fb0d9a68-cf3f-4768-b540-483468429470",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "dbz"
          },
          "target": {
            "block": "2cf01ed6-9923-4eee-9fd0-1c9c9ca24346",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "35d7e28a-1c9c-4460-8f01-efbfef5cb6fd",
            "port": "out"
          },
          "target": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "x"
          },
          "size": 16
        },
        {
          "source": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "r"
          },
          "target": {
            "block": "f036a77e-5138-429f-bfbe-f7d323b1ee57",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "5e264525-0798-4e4f-9ea4-d2ef25055a03",
            "port": "out"
          },
          "target": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "y"
          },
          "size": 16
        },
        {
          "source": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "q"
          },
          "target": {
            "block": "9824919f-2433-48fc-ab1b-be881b669920",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "pulse_done"
          },
          "target": {
            "block": "b594bd8c-4263-4b91-9aa3-591541041457",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {}
}