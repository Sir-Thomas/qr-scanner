/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2021 Tommy Priest tommy@sirthomas.xyz
 */

public class QrScannerApp : Gtk.Application {
    public QrScannerApp () {
        Object (
            application_id: "com.github.sirthomas.qr-scanner",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        add_window (new QrReader.Window (this));
    }

    public static int main (string[] args) {
        return new QrScannerApp ().run (args);
    }
}