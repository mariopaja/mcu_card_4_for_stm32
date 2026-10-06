# MIKROE MCU Card 4 - v4.2.0

MIKROE MCU Card 4 board files are separated in branches matching their respective zephyr version

## Usage
### Module installation

Add this project to your `west.yml` manifest:
```yaml
- name: mcu_card_4_for_stm32
  path: modules/mcu_card_4
  revision: v4.2.0
  url: https://github.com/mariopaja/mcu_card_4_for_stm32.git
```

So your projects should look something like this:
```yaml
manifest:
  projects:
    - name: zephyr
      url: https://github.com/zephyrproject-rtos/zephyr.git
      revision: v4.2.0
      path: zephyr
      west-commands: scripts/west-commands.yml
      import: true
    - name: mcu_card_4_for_stm32
      path: modules/mcu_card_4
      revision: v4.2.0
      url: https://github.com/mariopaja/mcu_card_4_for_stm32.git
```

This will import the board and allow you to use it in your code.

Additionally make sure that you run `west update` when you've added this entry to your `west.yml`.


## Supported MCU cards

The board is named `mcu_card_4`; select the MCU card with the SoC qualifier:

| MCU card                  | Board target              |
|---------------------------|---------------------------|
| MCU Card 4 for STM32F429  | `mcu_card_4/stm32f429xx`  |

```sh
west build -b mcu_card_4/stm32f429xx samples/basic/blinky
```

### Adding a new MCU card

1. Add the SoC to `socs:` in `boards/mikroe/mcu_card_4/board.yml`.
2. Add `select SOC_<NAME> if BOARD_MCU_CARD_4_<NAME>` to `Kconfig.mcu_card_4`.
3. Add `mcu_card_4_<soc>.dts`, `mcu_card_4_<soc>.yaml`, `mcu_card_4_<soc>_defconfig`
   and `mcu_card_4_<soc>_connector.dtsi` (the card's `left_connector` /
   `right_connector` pin mapping). The DTS includes the connector file and then
   the shared `uni_clicker.dtsi`.
4. Add `support/openocd_<soc>.cfg` and any SoC-specific runner args in `board.cmake`.
