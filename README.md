# MIKROE MCU Card 4 for STM32 devicetree - v4.2.0

MIKROE MCU Card 4 for STM32 devicetree files are separated in branches matching their respective zephyr version

## Usage
### Module installation

Add this project to your `west.yml` manifest:
```yaml
- name: mcu_card_4_for_stm32
  path: modules/mcu_card_4_stm32
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
      path: modules/mcu_card_4_stm32
      revision: v4.2.0
      url: https://github.com/mariopaja/mcu_card_4_for_stm32.git
```

This will import the board and allow you to use it in your code.

Additionally make sure that you run `west update` when you've added this entry to your `west.yml`.


