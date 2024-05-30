{
  "version": "1.2",
  "package": {
    "name": "mul_int24_48",
    "version": "1.1",
    "description": "24 bit inputs signed integer multiplier, 48 bits output",
    "author": "",
    "image": "%3Csvg%20width=%22800%22%20height=%22600%22%20xmlns=%22http://www.w3.org/2000/svg%22%3E%3Ctitle%3ELayer%201%3C/title%3E%3Ctext%20transform=%22matrix(11.6228%200%200%2013.7183%20-1447.34%20-2037.34)%22%20stroke=%22#000%22%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22173.397%22%20x=%22135.701%22%20stroke-width=%220%22%20fill=%22#46673D%22%3EMUL%3C/text%3E%3Ctext%20transform=%22matrix(6.40974%200%200%205.3641%20-2559.75%20-1996.65)%22%20stroke=%22#000%22%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22472.357%22%20x=%22410.655%22%20stroke-width=%220%22%3Eint_24_48%3C/text%3E%3C/svg%3E"
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
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
          "id": "b594bd8c-4263-4b91-9aa3-591541041457",
          "type": "basic.output",
          "data": {
            "name": "done"
          },
          "position": {
            "x": 1616,
            "y": 192
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
          "id": "77545349-454a-4d5f-82e6-a8b1f6261f26",
          "type": "basic.output",
          "data": {
            "name": "busy"
          },
          "position": {
            "x": 1616,
            "y": 440
          }
        },
        {
          "id": "d4a50651-d0e3-467c-b4c0-9929c29580aa",
          "type": "basic.input",
          "data": {
            "name": "a",
            "range": "[23:0]",
            "clock": false,
            "size": 24
          },
          "position": {
            "x": 296,
            "y": 528
          }
        },
        {
          "id": "5ad5cdaf-eac8-4f25-a6c8-e58a7fb9330c",
          "type": "basic.output",
          "data": {
            "name": "y",
            "range": "[47:0]",
            "size": 48
          },
          "position": {
            "x": 1632,
            "y": 680
          }
        },
        {
          "id": "9a16426a-61e8-4dfc-85e1-bfe7d697658c",
          "type": "basic.input",
          "data": {
            "name": "b",
            "range": "[23:0]",
            "clock": false,
            "size": 24
          },
          "position": {
            "x": 296,
            "y": 712
          }
        },
        {
          "id": "396814a2-9764-4311-96f8-10d766e29af3",
          "type": "basic.code",
          "data": {
            "code": "// y = a * b, signed integers\r\n\r\nlocalparam N = 24;\r\n\r\nreg [(N+N-1):0] y_i = 0;\r\nassign y = y;\r\nreg out_valid;\r\nreg ready = 1;\r\nreg pulse_done_i = 0;\r\nassign pulse_done = pulse_done_i;\r\nreg busy_i = 0;\r\nassign busy = busy_i;\r\n\r\nreg [N-1:0] A;\r\nreg [N-1:0] B;\r\nreg [$clog2(N+1)-1:0] state = 0;\r\nreg [N-1:0] work;   \r\nreg [N-2:0] resultLsb;\r\n\r\nwire [N-1:0] pp = {N{A[0]}} & B;\r\nwire [N-1:0] pMod1 = {~pp[N-1], pp[N-2:0]};\r\nwire [N-1:0] pMod2 = ~pMod1;\r\nwire [N:0] sum12 = work + ((state == N) ? pMod2 : pMod1);\r\nwire [N:0] sum1 = sum12;\r\nwire [N:0] sum2 = sum12;\r\n   \r\nreg prev_start = 0;   \r\n   \r\nalways @(posedge clk) \r\nbegin\r\n    out_valid <= 0;\r\n    A <= {1'bx, A[N-1:1]};      \r\n    case (state)\r\n\t    0:\r\n\t        begin \r\n\t            pulse_done_i <= 0;\r\n\t            busy_i <= 0;\r\n\t        end\r\n\t    1:  begin\r\n\t            work <= {1'b1, pMod1[N-1:1]};\r\n\t            resultLsb <= {pMod1[0], {N-2{1'bx}}};\r\n\t            state <= state + 1;\r\n\t        end\r\n\t    default: \r\n\t        begin\r\n\t            work <= sum1[N:1];\r\n\t            resultLsb <= {sum1[0], resultLsb[N-2:1]};\t   \r\n\t            state <= state + 1;\r\n\t        end\r\n\t    N: \r\n\t        begin\r\n\t            y_i <= {~sum2[N], sum2[N-1:0], resultLsb};\r\n\t            out_valid <= 1;\r\n\t            pulse_done_i <= 1;\r\n\t            work <= 'bx;\r\n\t            state <= 0;\r\n\t            resultLsb <= 'bx;\r\n\t            B <= 'bx;\r\n\t            ready <= 1;\t    \r\n\t        end\r\n    endcase\r\n      \r\n    if (start && !prev_start) \r\n    begin\r\n\t    A <= a;\r\n\t    B <= b;\r\n\t    state <= 1;\r\n\t    ready <= 0;\r\n\t    busy_i <= 1;\r\n    end\r\n    \r\n    prev_start <= start;\r\nend",
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
                  "name": "a",
                  "range": "[23:0]",
                  "size": 24
                },
                {
                  "name": "b",
                  "range": "[23:0]",
                  "size": 24
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
                  "name": "y",
                  "range": "[47:0]",
                  "size": 48
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
            "port": "pulse_done"
          },
          "target": {
            "block": "b594bd8c-4263-4b91-9aa3-591541041457",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "d4a50651-d0e3-467c-b4c0-9929c29580aa",
            "port": "out"
          },
          "target": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "a"
          },
          "size": 24
        },
        {
          "source": {
            "block": "9a16426a-61e8-4dfc-85e1-bfe7d697658c",
            "port": "out"
          },
          "target": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "b"
          },
          "size": 24
        },
        {
          "source": {
            "block": "396814a2-9764-4311-96f8-10d766e29af3",
            "port": "y"
          },
          "target": {
            "block": "5ad5cdaf-eac8-4f25-a6c8-e58a7fb9330c",
            "port": "in"
          },
          "size": 48
        }
      ]
    }
  },
  "dependencies": {}
}