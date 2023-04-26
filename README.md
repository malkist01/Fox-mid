# Device Tree for Xiaomi Redmi Note 4 & 4x (codenamed _"mido"_)

==================================
## Device specifications

| Feature                 | Specification                     |
| :---------------------- | :-------------------------------- |
| CPU                     | Octa-core 2.0 GHz Cortex-A53      |
| Chipset                 | Qualcomm MSM8953 Snapdragon 625   |
| GPU                     | Adreno 506                        |
| Memory                  | 2/3/4 GB                          |
| Shipped Android Version | 6.0.1                             |
| Storage                 | 16/32/64 GB                       |
| MicroSD                 | Up to 256 GB                      |
| Battery                 | 4100 mAh (non-removable)          |
| Dimensions              | 151 x 76 x 8.5 mm                 |
| Display                 | 1920x1080 pixels, 5.5 (~401 PPI)  |
| Rear Camera             | 13 MP, LED flash                  |
| Front Camera            | 5 MP                              |
| Release Date            | January 2017                      |

## Device Picture

![Redmi Note 4](http://i01.appmifile.com/webfile/globalimg/7/537557F3-A4F1-2490-E9D3-138B2A11DBF6.png "Redmi Note 4")

## Building
Generally, see https://wiki.orangefox.tech/en/dev/building

### Variants
1. For standard mode, build without any additional flags.
2. To build for ROMs using retrofitted dynamic partitions, run "export FOX_USE_DYNAMIC_PARTITIONS=1" before building.

### Kernel source
Clone this: "https://github.com/Alone0316/kernel_mido.git" ("-b sapphire")

### Copyright
 ```
  /*
  *  Copyright (C) 2013-2020 The TWRP
  *
  *  Copyright (C) 2018-2023 The OrangeFox Recovery Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
