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

    public void initSerial(String portName, int dataRate) {
        try {
            CommPortIdentifier portId = null;
            try {
                portId = CommPortIdentifier.getPortIdentifier(portName);
            } catch (NoSuchPortException npe) {
                npe.printStackTrace();
            }

            SerialPort port = (SerialPort) portId.open("Título comunicação serial", dataRate);

            port.setSerialPortParams(9600,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE);

            output = port.getOutputStream();
            input = port.getInputStream();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            output.close();
            input.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void writeData(int data) {
        try {
            output.write(data);
            while (input.available() > 0) {
                System.out.println((char) input.read());
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void readData() {
    }
}
