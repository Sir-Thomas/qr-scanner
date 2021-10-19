public class QrReader.Window : Gtk.ApplicationWindow {
    public Window (Gtk.Application app) {
        Object (
            application: app
        );
    }

    construct {
        default_height = 600;
        default_width = 300;
        title = _("QR Scanner");
        add (new QrReader.QrGrid());
        show_all ();
    }
}