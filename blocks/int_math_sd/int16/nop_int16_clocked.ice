{
  "version": "1.2",
  "package": {
    "name": "nop_int16_clocked",
    "version": "1.1",
    "description": "pos and neg edge d-flipflip, 16 bits",
    "author": "Sicco Dwars",
    "image": "%3Csvg%20width=%22800%22%20height=%22600%22%20xmlns=%22http://www.w3.org/2000/svg%22%3E%3Ctitle%3ELayer%201%3C/title%3E%3Ctext%20transform=%22matrix(12.6242%200%200%2016.1703%20-1655.38%20-2425.97)%22%20stroke=%22#000%22%20font-family=%22sans-serif%22%20font-size=%2220%22%20y=%22172.618%22%20x=%22143.199%22%20stroke-width=%220%22%20fill=%22#46673D%22%3ENOP%3C/text%3E%3Ctext%20transform=%22matrix(6.40974%200%200%205.3641%20-2559.75%20-1996.65)%22%20stroke=%22#000%22%20font-family=%22sans-serif%22%20font-size=%2224%22%20y=%22473.849%22%20x=%22434.369%22%20stroke-width=%220%22%3Eint_16%3C/text%3E%3Ctext%20transform=%22matrix(4.31725%200%200%204.90156%20-181.432%20-1113.11)%22%20stroke=%22#000%22%20font-family=%22sans-serif%22%20font-size=%2220%22%20y=%22318.522%22%20x=%2250.22%22%20stroke-width=%220%22%20fill=%22#46673D%22%3EA%3C/text%3E%3Ctext%20transform=%22matrix(3.27248%200%200%203.42821%20-129.691%20-767.106)%22%20stroke=%22#000%22%20font-family=%22sans-serif%22%20font-size=%2220%22%20y=%22288.649%22%20x=%2252.971%22%20stroke-width=%220%22%20fill=%22#46673D%22%3Eclk%3C/text%3E%3Ctext%20transform=%22matrix(2.85773%200%200%203.25982%2084.859%20-718.562)%22%20stroke=%22#000%22%20font-family=%22sans-serif%22%20font-size=%2220%22%20y=%22254.869%22%20x=%22198.231%22%20stroke-width=%220%22%20fill=%22#46673D%22%3Edone%3C/text%3E%3Cpath%20stroke=%22#000%22%20stroke-width=%226%22%20fill=%22none%22%20d=%22M-1%20150l33%2040M-1%20230l34-43%22/%3E%3C/svg%3E"
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "a41d8452-ea53-4f89-9710-5ecb6a0017e0",
          "type": "basic.input",
          "data": {
            "name": "clk_in",
            "clock": false
          },
          "position": {
            "x": 24,
            "y": 24
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
            "x": 792,
            "y": 120
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
            "x": 16,
            "y": 216
          }
        },
        {
          "id": "1305a83f-5378-4d61-a0ab-8ad1e8b196d4",
          "type": "basic.code",
          "data": {
            "code": "// y <= a\n\nreg [15:0] y_i = 0;\nassign y = y_i;\n\nalways @(posedge clk)\n    y_i <= a;\n\n",
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
                }
              ],
              "out": [
                {
                  "name": "y",
                  "range": "[15:0]",
                  "size": 16
                }
              ]
            }
          },
          "position": {
            "x": 224,
            "y": -40
          },
          "size": {
            "width": 472,
            "height": 384
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
            "block": "a41d8452-ea53-4f89-9710-5ecb6a0017e0",
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