public class QrScanner.HeaderBar : Gtk.HeaderBar {
    construct {
        set_title(_("QR Scanner"));
        set_show_close_button(true);

        var new_task = new Gtk.Button.with_label (_("Add"));
        new_task.get_style_context ().add_class ("suggested-action");
        new_task.valign = Gtk.Align.CENTER;
        pack_start (new_task);

        var menu_button = new Gtk.Button.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
        pack_end (menu_button);
    }
}