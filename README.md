# MIKROE UNI Clicker - v4.2.0

MIKROE UNI Clicker board files are separated in branches matching their respective zephyr version

## Usage
### Module installation

Add this project to your `west.yml` manifest:
```yaml
- name: mcu_card_4_for_stm32
  path: modules/uni_clicker
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
      path: modules/uni_clicker
      revision: v4.2.0
      url: https://github.com/mariopaja/mcu_card_4_for_stm32.git
```

This will import the board and allow you to use it in your code.

Additionally make sure that you run `west update` when you've added this entry to your `west.yml`.


## Supported MCU cards

The board is the UNI Clicker carrier, named `uni_clicker`. Select the plugged-in
MCU card with the `<soc>/<card>` qualifiers:

| MCU card                              | Board target                          |
|---------------------------------------|---------------------------------------|
| MCU CARD 4 for STM32 (STM32F429NI)    | `uni_clicker/stm32f429xx/mcu_card_4`  |

```sh
west build -b uni_clicker/stm32f429xx/mcu_card_4 samples/basic/blinky
```

### Adding a new MCU card

1. Add the SoC (if new) and the card as a variant under `socs:` in
   `boards/mikroe/uni_clicker/board.yml`.
2. Add `select SOC_<SOC> if BOARD_UNI_CLICKER_<SOC>_<CARD>` to `Kconfig.uni_clicker`.
3. Add `<card>_<part>.dtsi` with the card's `left_connector` / `right_connector` pin mapping.
4. Add `uni_clicker_<soc>_<card>.dts`, `.yaml` and `_defconfig`. The DTS includes the
   SoC dtsi, the card dtsi and then the shared `uni_clicker.dtsi`.
5. Add `support/openocd_<soc>_<card>.cfg` and any card-specific runner args in `board.cmake`.
