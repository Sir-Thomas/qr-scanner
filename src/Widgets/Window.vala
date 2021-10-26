public class QrScanner.Window : Gtk.ApplicationWindow {
    public GLib.Settings settings;

    public Window (Gtk.Application app) {
        Object (application: app);
    }

    construct {
        settings = new GLib.Settings ("com.github.sirthomas.qr-reader");
        title = "QR Scanner";
        default_height = settings.get_int ("window-height");
        default_width = settings.get_int ("window-width");
        if (settings.get_boolean ("is-maximized")) {
            maximize ();
        }

        var box = new QrScanner.Box ();

        child = box;

        close_request.connect (before_close);
    }

    public bool before_close () {
        int width, height;
        bool max;

        get_default_size (out width, out height);
        max = is_maximized ();

        settings.set_int ("window-width", width);
        settings.set_int ("window-height", height);
        settings.set_boolean ("is-maximized", max);

        return false;
    }
}