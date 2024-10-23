// SPDX-FileCopyrightText: 2023 Efabless Corporation

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//      http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


#include <firmware_apis.h> // include required APIs

void main(){
    ManagmentGpio_outputEnable();
    ManagmentGpio_write(0);
    enableHkSpi(0); // disable housekeeping spi
    // configure all gpios as  user out then chenge gpios from 32 to 37 before loading this configurations
    GPIOs_configure(6,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_loadConfigs(); // load the configuration 
    
    // Enable UART
    UART_enableTX(1);
    
    User_enableIF(); // this necessary when reading or writing between wishbone and user project if interface isn't enabled no ack would be recieve and the command will be stuck
    ManagmentGpio_write(1); // configuration finished 
    // writing to any address inside user project address space would reload the counter value
    
    // In theory: Write to fifo, then read result
    USER_writeWord(0xABBA,0);
    uint32_t data = USER_readWord(0);
    UART_sendInt(data);
    

    return;
}