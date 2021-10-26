public class QrScanner.Window : Gtk.ApplicationWindow {
    public GLib.Settings settings;
    public Gtk.Stack stack { get; set; }

    public Window (Gtk.Application app) {
        Object (application: app);
    }

    construct {
        settings = new GLib.Settings ("com.github.sirthomas.qr-reader");
        move (settings.get_int ("x-pos"), settings.get_int ("y-pos"));
        resize (settings.get_int ("window-width"), settings.get_int ("window-height"));

        delete_event.connect (e => {
            return before_destroy ();
        });

        stack = new Gtk.Stack ();
        stack.expand = true;
        var outstanding = new Gtk.Grid ();
        outstanding.add (new Gtk.Label ("Outstanding Page"));
        var completed = new Gtk.Grid ();
        completed.add (new QrScanner.QrGrid ());

        stack.add_titled (outstanding, "outstanding", "Outstanding");
        stack.add_titled (completed, "completed", "Completed");

        var headerbar = new QrScanner.HeaderBar (this);
        set_titlebar (headerbar);

        add (stack);
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