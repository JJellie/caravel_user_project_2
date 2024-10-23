from caravel_cocotb.caravel_interfaces import test_configure
from caravel_cocotb.caravel_interfaces import report_test
from caravel_cocotb.caravel_interfaces import UART
from caravel_cocotb.caravel_interfaces import SPI
import cocotb

@cocotb.test() # decorator to mark the test function as cocotb test
@report_test # wrapper for configure test reporting files
async def test1(dut):
    caravelEnv = await test_configure(dut) #configure, start up and reset Caravel
    uart = UART(caravelEnv)
    cocotb.log.info(f"[TEST] Start wishbone test")  
    # wait for start of sending
    # await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish configuration") 
    msg = await uart.get_int()
    cocotb.log.info(f"[TEST] read {msg}")