#!/usr/bin/env cwl-runner
### Wrapper aorund gnuplot
#  Copyright (c) 2023. Harvard University
#
#  Developed by Research Software Engineering,
#  Faculty of Arts and Sciences, Research Computing (FAS RC)
#  Author: Michael A Bouzinier
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

cwlVersion: v1.2
class: CommandLineTool
baseCommand: [gnuplot]

requirements:
  InlineJavascriptRequirement: {}

hints:
  DockerRequirement:
    dockerPull: forome/slimpipe

doc: |
  Simple tool to use Gnu Plot

inputs:
  script:
    type: File
    inputBinding:
      position: 1
    doc: Path to the file with Gnuplot script
  data:
    type: File
    doc: Path the tab-separated data file

arguments:
  - prefix: '-e'
    valueFrom: $("plot '" + inputs.data.path + "' using 3:xtic(2) with histogram notitle")
    position: 2


outputs:
  plot:
    type: stdout

stdout: $(inputs.data.nameroot + ".png")
