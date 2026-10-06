# SPDX-License-Identifier: Apache-2.0

if(CONFIG_BOARD_UNI_CLICKER_STM32F429XX)
  board_runner_args(jlink "--device=STM32F429NI" "--speed=4000")
endif()

board_runner_args(openocd "--config=${BOARD_DIR}/support/openocd_${CONFIG_BOARD_QUALIFIERS}.cfg")

if(CONFIG_SOC_FAMILY_STM32)
  # keep first
  board_runner_args(stm32cubeprogrammer "--port=swd" "--reset-mode=hw")

  # keep first
  include(${ZEPHYR_BASE}/boards/common/stm32cubeprogrammer.board.cmake)
  include(${ZEPHYR_BASE}/boards/common/openocd-stm32.board.cmake)
else()
  include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
endif()

include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
