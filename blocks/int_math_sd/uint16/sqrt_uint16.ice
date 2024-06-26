{
  "version": "1.2",
  "package": {
    "name": "sqrt_uint16",
    "version": "1.1",
    "description": "16 bits unsigned integer square root",
    "author": "",
    "image": "%3Csvg%20width=%22800%22%20height=%22600%22%20xmlns=%22http://www.w3.org/2000/svg%22%3E%3Ctitle%3ELayer%201%3C/title%3E%3Ctext%20fill=%22#46673D%22%20stroke-width=%220%22%20x=%22144.046%22%20y=%22175.088%22%20font-size=%2224%22%20font-family=%22sans-serif%22%20stroke=%22#000%22%20transform=%22matrix(7.52166%200%200%2014.1586%20-949.633%20-2116.94)%22%3ESQRT%3C/text%3E%3Ctext%20stroke-width=%220%22%20x=%22407.223%22%20y=%22473.289%22%20font-size=%2224%22%20font-family=%22sans-serif%22%20stroke=%22#000%22%20transform=%22matrix(6.02479%200%200%203.13937%20-2290.17%20-952.151)%22%20cursor=%22move%22%3Euint_16%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%2299%22%20x=%2260%22%20stroke-width=%220%22%20stroke=%22#000%22%3ECLK%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22302%22%20x=%2220%22%20stroke-width=%220%22%20stroke=%22#000%22%3Estart%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22439%22%20x=%2223%22%20stroke-width=%220%22%20stroke=%22#000%22%3EX%3C/text%3E%3Cpath%20stroke-width=%224%22%20stroke=%22#000%22%20fill=%22none%22%20d=%22M-1%2049l42%2039M41%2090l-43%2036%22/%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22184%22%20x=%22712%22%20stroke-width=%220%22%20stroke=%22#000%22%3EBUSY%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22286%22%20x=%22709%22%20stroke-width=%220%22%20stroke=%22#000%22%3EVALID%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22499%22%20x=%22734%22%20stroke-width=%220%22%20stroke=%22#000%22%20cursor=%22move%22%3Erem%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%2272%22%20x=%22708%22%20stroke-width=%220%22%20stroke=%22#000%22%3EDONE%3C/text%3E%3Cpath%20stroke=%22#000%22%20fill=%22none%22%20d=%22M638%2094h40M679%2062v29M694%2063l-14-1M693%2095V65M772%2095h-81M683%20363v-4M800%20601l18%2025%22/%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22394%22%20x=%22732%22%20stroke-width=%220%22%20stroke=%22#000%22%3Eroot%3C/text%3E%3C/svg%3E"
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "809d85b1-c885-4644-8b85-fcd70213c7f5",
          "type": "basic.output",
          "data": {
            "name": "done"
          },
          "position": {
            "x": 1576,
            "y": 144
          }
        },
        {
          "id": "5264574c-d18b-4650-91e3-281fd14afab6",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 184
          }
        },
        {
          "id": "02dea73d-c990-4b94-b7b2-7ea483c08117",
          "type": "basic.output",
          "data": {
            "name": "busy"
          },
          "position": {
            "x": 1576,
            "y": 280
          }
        },
        {
          "id": "62d896b7-cfe1-4529-ae11-c609d38e3d2a",
          "type": "basic.input",
          "data": {
            "name": "start",
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 416
          }
        },
        {
          "id": "90b26dcb-350b-4d3a-8067-f5af3241360e",
          "type": "basic.output",
          "data": {
            "name": "valid"
          },
          "position": {
            "x": 1576,
            "y": 416
          }
        },
        {
          "id": "573f69e9-a206-45fc-978c-044924976e1c",
          "type": "basic.output",
          "data": {
            "name": "root",
            "range": "[15:0]",
            "size": 16
          },
          "position": {
            "x": 1576,
            "y": 544
          }
        },
        {
          "id": "9a6c6153-791d-43ed-958c-1d938658cbf0",
          "type": "basic.input",
          "data": {
            "name": "rad",
            "range": "[15:0]",
            "clock": false,
            "size": 16
          },
          "position": {
            "x": 328,
            "y": 640
          }
        },
        {
          "id": "6d836ce7-4491-49e1-ad18-e40c6c47202c",
          "type": "basic.output",
          "data": {
            "name": "rem",
            "range": "[15:0]",
            "size": 16
          },
          "position": {
            "x": 1576,
            "y": 688
          }
        },
        {
          "id": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
          "type": "basic.code",
          "data": {
            "code": "localparam WIDTH = 16;\r\n\r\nreg prev_start = 0;\r\n\r\nreg pulse_done_i = 0;\r\nassign pulse_done = pulse_done_i;\r\nreg busy_i = 0;\r\nassign busy = busy_i;\r\nreg valid_i = 0;\r\nassign valid = valid_i;\r\nreg [WIDTH-1:0] root_i = 0;\r\nassign root = root_i;\r\nreg [WIDTH-1:0] rem_i = 0;\r\nassign rem = rem_i;\r\n\r\n\r\nreg [WIDTH-1:0] x, x_next;    // radicand copy\r\nreg [WIDTH-1:0] q, q_next;    // intermediate root (quotient)\r\nreg [WIDTH+1:0] ac, ac_next;  // accumulator (2 bits wider)\r\nreg [WIDTH+1:0] test_res;     // sign test result (2 bits wider)\r\n\r\nwire [WIDTH+1:0] test_resw;\r\n\r\nlocalparam ITER = WIDTH >> 1;   // iterations are half radicand width\r\nreg [$clog2(ITER)-1:0] i;     // iteration counter\r\n\r\nassign test_resw = ac - {q, 2'b01};\r\n\r\nalways @(negedge clk) \r\nbegin\r\n    if (test_resw[WIDTH+1] == 0) \r\n    begin  // test_res ≥0? (check MSB)\r\n        {ac_next, x_next} <= {test_resw[WIDTH-1:0], x, 2'b0};\r\n        q_next = {q[WIDTH-2:0], 1'b1};\r\n    end \r\n    else \r\n    begin\r\n        {ac_next, x_next} <= {ac[WIDTH-1:0], x, 2'b0};\r\n        q_next <= q << 1;\r\n    end\r\nend\r\n\r\nalways @(posedge clk) \r\nbegin\r\n    prev_start <= start;\r\n\r\n    if (start && !prev_start) \r\n    begin\r\n        busy_i <= 1;\r\n        valid_i <= 0;\r\n        i <= 0;\r\n        q <= 0;\r\n        {ac, x} <= {{WIDTH{1'b0}}, rad, 2'b0};\r\n    end \r\n    else \r\n        if (busy) \r\n        begin\r\n            if (i == ITER-1) \r\n            begin  // we're done\r\n                busy_i <= 0;\r\n                pulse_done_i <= 1;\r\n                valid_i <= 1;\r\n                root_i <= q_next;\r\n                rem_i <= ac_next[WIDTH+1:2];  // undo final shift\r\n            end \r\n            else \r\n            begin  // next iteration\r\n                i <= i + 1;\r\n                x <= x_next;\r\n                ac <= ac_next;\r\n                q <= q_next;\r\n            end\r\n        end\r\n        else\r\n            pulse_done_i <= 0;\r\n\r\nend\r\n",
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
                  "name": "rad",
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
                  "name": "root",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "rem",
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
            "width": 1008,
            "height": 680
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "5264574c-d18b-4650-91e3-281fd14afab6",
            "port": "out"
          },
          "target": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "62d896b7-cfe1-4529-ae11-c609d38e3d2a",
            "port": "out"
          },
          "target": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "start"
          }
        },
        {
          "source": {
            "block": "9a6c6153-791d-43ed-958c-1d938658cbf0",
            "port": "out"
          },
          "target": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "rad"
          },
          "size": 16
        },
        {
          "source": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "busy"
          },
          "target": {
            "block": "02dea73d-c990-4b94-b7b2-7ea483c08117",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "valid"
          },
          "target": {
            "block": "90b26dcb-350b-4d3a-8067-f5af3241360e",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "root"
          },
          "target": {
            "block": "573f69e9-a206-45fc-978c-044924976e1c",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "rem"
          },
          "target": {
            "block": "6d836ce7-4491-49e1-ad18-e40c6c47202c",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "1bc44cb2-7352-42e1-a7ab-3252cb5f72c2",
            "port": "pulse_done"
          },
          "target": {
            "block": "809d85b1-c885-4644-8b85-fcd70213c7f5",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {}
}