public class QrScanner.Window : Gtk.ApplicationWindow {
    public GLib.Settings settings;

    public Window (Gtk.Application app) {
        Object (
            application: app
        );
    }

    construct {
        title = _("QR Scanner");
        default_height = 600;
        default_width = 300;

        settings = new GLib.Settings ("com.github.sirthomas.qr-reader");
        move (settings.get_int ("x-pos"), settings.get_int ("y-pos"));
        resize (settings.get_int ("window-width"), settings.get_int ("window-height"));

        delete_event.connect (e => {
            return before_destroy ();
        });

        var headerbar = new QrScanner.HeaderBar ();
        set_titlebar (headerbar);

        add (new QrScanner.QrGrid());
        show_all ();
    }

    public bool before_destroy () {
        int width, height, x, y;

        get_size (out width, out height);
        get_position (out x, out y);

        settings.set_int ("x-pos", x);
        settings.set_int ("y-pos", y);
        settings.set_int ("window-width", width);
        settings.set_int ("window-height", height);

        return false;
    }
}