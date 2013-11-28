/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serial;

import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.SerialPort;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 *
 * @author vpaz
 */
public class SerialCommunication {

    static OutputStream output;
    static InputStream input;
    static SerialPort port;

    public void initSerial(String portName, int dataRate) {
        try {
            CommPortIdentifier portId = null;
            try {
                portId = CommPortIdentifier.getPortIdentifier(portName);
            } catch (NoSuchPortException npe) {
                npe.printStackTrace();
            }

            port = (SerialPort) portId.open("Título comunicação serial", dataRate);

            output = port.getOutputStream();
            input = port.getInputStream();

            port.setSerialPortParams(9600,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {

            output.close();
            input.close();
            port.removeEventListener();
            port.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void writeData(byte[] data) {
        try {
            output.write(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void readData() {
    }
}
