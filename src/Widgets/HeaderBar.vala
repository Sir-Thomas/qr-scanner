public class QrScanner.HeaderBar : Gtk.HeaderBar {
    public QrScanner.Window window { get; construct; }
    
    public HeaderBar (QrScanner.Window w) {
        Object (window: w);
    }

    construct {
        set_show_close_button(true);

        var new_task = new Gtk.Button.with_label (_("Add"));
        new_task.get_style_context ().add_class ("suggested-action");
        new_task.valign = Gtk.Align.CENTER;
        pack_start (new_task);


        new_task.clicked.connect (open_dialog);

        var menu_button = new Gtk.Button.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
        pack_end (menu_button);

        var stack_switcher = new Gtk.StackSwitcher ();
        stack_switcher.stack = window.stack;

        set_custom_title (stack_switcher);
    }

    public void open_dialog () {
        var dialog = new Gtk.Dialog.with_buttons (
            "Add a New Task",
            window,
            Gtk.DialogFlags.DESTROY_WITH_PARENT |
            Gtk.DialogFlags.MODAL,
            "Cancel", 1,
            "Add", 2,
            null
        );

        var label = new Gtk.Label ("Add a task to your to-do list");
        var content_area = dialog.get_content_area ();
        content_area.add (label);

        dialog.show_all ();
        dialog.present ();
    }
}