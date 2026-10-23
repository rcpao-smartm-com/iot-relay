// sudo node on.js

const fs = require('fs');
const path = require('path');

// --- THE MATHEMATICAL MAPPING ---
// Your kernel's main GPIO chip starts at 512
const GPIO_BASE = 512; 
const BCM_PIN = 4; // Broadcom GPIO 4 (Physical Pin 7)
const SYSTEM_PIN_NUMBER = String(GPIO_BASE + BCM_PIN); // "516"

const GPIO_PATH = `/sys/class/gpio/gpio${SYSTEM_PIN_NUMBER}`;

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function turnOnRelay() {
    try {
        // 1. Export the pin if it hasn't been exported already
        if (!fs.existsSync(GPIO_PATH)) {
            fs.writeFileSync('/sys/class/gpio/export', SYSTEM_PIN_NUMBER);
            // Give the kernel a brief moment to generate file nodes
            await sleep(100); 
        }

        // 2. Set the data direction to output
        fs.writeFileSync(path.join(GPIO_PATH, 'direction'), 'out');

        // 3. Write HIGH (1) to turn the relay pin ON
        fs.writeFileSync(path.join(GPIO_PATH, 'value'), '1');
        
        console.log(`Success! Base pin ${SYSTEM_PIN_NUMBER} (BCM ${BCM_PIN}) pulled HIGH.`);
    } catch (err) {
        console.error('Kernel Interface Error:', err);
    }
}

turnOnRelay();

