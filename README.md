# Gamepad Mapper Script

This script helps map your Dualshock gamepad to act like an Xbox 360 controller using `xboxdrv`.

## Requirements

- `xboxdrv` must be installed. 

## Usage

1.  Make the script executable:
    ```bash
    chmod +x gamepad.sh
    ```
2.  Run the script:
    ```bash
    ./gamepad.sh
    ```

The script will automatically detect your "Wireless Controller" and start `xboxdrv` with the predefined button and axis mappings.
