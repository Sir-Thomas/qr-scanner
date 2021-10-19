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
        var label = new Gtk.Label ("Scan a QR code");
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 600,
            default_width = 300,
            title = "QR Scanner"
        };
        main_window.add (label);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        return new QrScannerApp ().run (args);
    }
}