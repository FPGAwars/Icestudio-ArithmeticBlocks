{
  "version": "1.2",
  "package": {
    "name": "muldiv_int16_sat_clocked",
    "version": "1.1",
    "description": "clocked 16 bits signed integer multiplication and division with minint,maxint saturation",
    "author": "Sicco Dwars",
    "image": "%3Csvg%20width=%22800%22%20height=%22600%22%20xmlns=%22http://www.w3.org/2000/svg%22%3E%3Ctitle%3ELayer%201%3C/title%3E%3Ctext%20fill=%22#46673D%22%20stroke-width=%220%22%20x=%22138.638%22%20y=%22173.671%22%20font-size=%2224%22%20font-family=%22sans-serif%22%20stroke=%22#000%22%20transform=%22matrix(6.12846%200%200%2014.5988%20-734.172%20-2177.67)%22%3EMULDIV%3C/text%3E%3Ctext%20stroke-width=%220%22%20x=%22407.223%22%20y=%22473.289%22%20font-size=%2224%22%20font-family=%22sans-serif%22%20stroke=%22#000%22%20transform=%22matrix(6.02479%200%200%203.13937%20-2371.17%20-955.151)%22%3Eint_16_sat%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%2284%22%20x=%2216%22%20stroke-width=%220%22%20stroke=%22#000%22%3EA%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22271%22%20x=%2213%22%20stroke-width=%220%22%20stroke=%22#000%22%3E*%3C/text%3E%3Ctext%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22456%22%20x=%2214%22%20stroke-width=%220%22%20stroke=%22#000%22%3E/%3C/text%3E%3C/svg%3E"
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "16fc1062-1434-41f5-b59f-8ea50156cae0",
          "type": "basic.output",
          "data": {
            "name": "clk_out"
          },
          "position": {
            "x": 904,
            "y": -16
          }
        },
        {
          "id": "49ffa13a-6b40-4af0-8589-121948fc1ccd",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "clock": false
          },
          "position": {
            "x": 0,
            "y": -16
          }
        },
        {
          "id": "a947797a-75f6-419b-8ebc-98ee46ff3307",
          "type": "basic.output",
          "data": {
            "name": "y",
            "range": "[15:0]",
            "size": 16
          },
          "position": {
            "x": 912,
            "y": 104
          }
        },
        {
          "id": "4d45fe21-e51e-4794-8198-1a724fcfcfe4",
          "type": "basic.input",
          "data": {
            "name": "a",
            "range": "[15:0]",
            "clock": false,
            "size": 16
          },
          "position": {
            "x": 0,
            "y": 104
          }
        },
        {
          "id": "7376e6a0-ed86-48b1-b06f-59cfe1915a37",
          "type": "basic.output",
          "data": {
            "name": "clipMaxInt"
          },
          "position": {
            "x": 912,
            "y": 216
          }
        },
        {
          "id": "62db479e-f47e-4d03-9093-d3610ae08709",
          "type": "basic.input",
          "data": {
            "name": "mul",
            "range": "[15:0]",
            "clock": false,
            "size": 16
          },
          "position": {
            "x": 0,
            "y": 216
          }
        },
        {
          "id": "5aad4260-c2e8-44ca-a726-52122bc47a1e",
          "type": "basic.output",
          "data": {
            "name": "clipMinInt"
          },
          "position": {
            "x": 912,
            "y": 336
          }
        },
        {
          "id": "261ad5a4-3233-4df3-a493-9fa7894c09c4",
          "type": "basic.input",
          "data": {
            "name": "div",
            "range": "[15:0]",
            "clock": false,
            "size": 16
          },
          "position": {
            "x": 0,
            "y": 336
          }
        },
        {
          "id": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
          "type": "basic.code",
          "data": {
            "code": "// y = (a * mul) / div;  signed 16 bits integers, coerce product y in [-32768..32767 range]\n\nwire signed [31:0] product32bits;\nwire signed [31:0] div32bits;\nwire divideby0;\n\nreg [15:0] y_i = 0;\nassign y = y_i;\nreg devideby0_out = 0;\nreg clk_out_i = 0;\nassign clk_out = clk_out_i;\nreg clipMaxInt_out = 0;\nreg clipMinInt_out = 0;\n\nassign divideby0 = (div == 0);\nassign product32bits = $signed(a) * $signed(mul);\nassign div32bits = product32bits / $signed(div);\nassign clipMinInt = (div32bits < $signed(-32768));\nassign clipMaxInt = (div32bits > $signed(32767));\n\nalways @(clk)\nbegin\n    y_i <= (a==0) ? 0 : (divideby0) ? 32767 : (clipMinInt) ? -32768 : (clipMaxInt) ? 32767 :div32bits[15:0];\n    devideby0_out <= divideby0;\n    clipMaxInt_out <= clipMaxInt;\n    clipMinInt_out <= clipMinInt;\n    clk_out_i <= clk;\nend\n\n",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "a",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "mul",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "div",
                  "range": "[15:0]",
                  "size": 16
                }
              ],
              "out": [
                {
                  "name": "clk_out"
                },
                {
                  "name": "y",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "clipMaxInt"
                },
                {
                  "name": "clipMinInt"
                }
              ]
            }
          },
          "position": {
            "x": 224,
            "y": -40
          },
          "size": {
            "width": 600,
            "height": 464
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "4d45fe21-e51e-4794-8198-1a724fcfcfe4",
            "port": "out"
          },
          "target": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "a"
          },
          "size": 16
        },
        {
          "source": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "clipMaxInt"
          },
          "target": {
            "block": "7376e6a0-ed86-48b1-b06f-59cfe1915a37",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "clipMinInt"
          },
          "target": {
            "block": "5aad4260-c2e8-44ca-a726-52122bc47a1e",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "y"
          },
          "target": {
            "block": "a947797a-75f6-419b-8ebc-98ee46ff3307",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "62db479e-f47e-4d03-9093-d3610ae08709",
            "port": "out"
          },
          "target": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "mul"
          },
          "size": 16
        },
        {
          "source": {
            "block": "261ad5a4-3233-4df3-a493-9fa7894c09c4",
            "port": "out"
          },
          "target": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "div"
          },
          "size": 16
        },
        {
          "source": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "clk_out"
          },
          "target": {
            "block": "16fc1062-1434-41f5-b59f-8ea50156cae0",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "49ffa13a-6b40-4af0-8589-121948fc1ccd",
            "port": "out"
          },
          "target": {
            "block": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
            "port": "clk"
          }
        }
      ]
    }
  },
  "dependencies": {}
}