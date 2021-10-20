public class QrReader.Window : Gtk.ApplicationWindow {
    public Window (Gtk.Application app) {
        Object (
            application: app
        );
    }

    construct {
        title = _("QR Scanner");
        default_height = 600;
        default_width = 300;

        var settings = new GLib.Settings ("com.github.sirthomas.qr-reader");
        move (settings.get_int ("x-pos"), settings.get_int ("y-pos"));

        add (new QrReader.QrGrid());
        show_all ();
    }
}