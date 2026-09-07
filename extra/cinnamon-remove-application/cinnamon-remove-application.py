#!/usr/bin/python3

# authors: Linux Mint team
#          Giulio Girardi (rapgenic)
#          stephan
#
# Arch linux version of cinnamon-remove-application (enables the uninstall option in the right click Cinnamon application menu)
#

import gettext
import os
import subprocess
import sys
import threading

import gi
gi.require_version('Gtk', '3.0')

from gi.repository import Gtk
from subprocess import Popen

# i18n
gettext.install("mint-common", "/usr/share/locale")


class RemoveExecuter(threading.Thread):

    def __init__(self, package):
        threading.Thread.__init__(self)
        self.package = package

    def run(self):
        cmd = ["pkexec", "/usr/bin/pacman", "-Rc", "--noconfirm", "--noprogressbar", self.package]
        comnd = Popen(cmd)
        sys.exit(comnd.wait())

class RemoveWindow:

    def __init__(self, desktopFile):
        self.desktopFile = desktopFile
        process = subprocess.run(["pacman", "-Qoq", self.desktopFile], stdout=subprocess.PIPE)
        output = process.stdout.decode("utf-8")
        package = output[:output.find(":")].split(",")[0]
        if process.returncode != 0:
            if not self.try_remove_flatpak(desktopFile):
                warnDlg = Gtk.MessageDialog(parent=None,
                                            flags=0,
                                            message_type=Gtk.MessageType.WARNING,
                                            buttons=Gtk.ButtonsType.YES_NO,
                                            text=_("This menu item is not associated to any package. Do you want to remove it from the menu anyway?"))
                warnDlg.set_keep_above(True)

                warnDlg.get_widget_for_response(Gtk.ResponseType.YES).grab_focus()
                warnDlg.vbox.set_spacing(12)
                warnDlg.set_border_width(12)
                response = warnDlg.run()
                if response == Gtk.ResponseType.YES:
                    print ("removing '%s'" % self.desktopFile)
                    subprocess.run(["rm", "-f", self.desktopFile])
                    subprocess.run(["rm", "-f", "%s.desktop" % self.desktopFile])
                warnDlg.destroy()
            sys.exit(0)

        #create dialogue
        warnDlg = Gtk.MessageDialog(parent=None,
                                    flags=0,
                                    message_type=Gtk.MessageType.WARNING,
                                    buttons=Gtk.ButtonsType.OK_CANCEL,
                                    text=_("The following packages will be removed:"))
        warnDlg.set_keep_above(True)

        warnDlg.get_widget_for_response(Gtk.ResponseType.OK).grab_focus()
        warnDlg.vbox.set_spacing(12)

        treeview = Gtk.TreeView()
        column1 = Gtk.TreeViewColumn(_("Packages to be removed"))
        renderer = Gtk.CellRendererText()
        column1.pack_start(renderer, False)
        column1.add_attribute(renderer, "text", 0)
        treeview.append_column(column1)

        packages = []
        model = Gtk.ListStore(str)
        dependenciesString = subprocess.getoutput("pacman -Rpc " + package)
        dependencies = dependenciesString.split("\n")
        for dependency in dependencies:
            model.append([dependency])
            packages.append(dependency.split()[0])
        treeview.set_model(model)
        treeview.show()

        scrolledwindow = Gtk.ScrolledWindow()
        scrolledwindow.set_shadow_type(Gtk.ShadowType.ETCHED_OUT)
        scrolledwindow.set_size_request(150, 150)
        scrolledwindow.add(treeview)
        scrolledwindow.show()

        warnDlg.get_content_area().add(scrolledwindow)
        warnDlg.set_border_width(12)

        response = warnDlg.run()
        if response == Gtk.ResponseType.OK:
            executer = RemoveExecuter(package)
            executer.start()
            executer.join()
        elif response == Gtk.ResponseType.CANCEL:
            sys.exit(0)

        warnDlg.destroy()


if __name__ == "__main__":

    # Exit if the given path does not exist
    if len(sys.argv) < 2 or not os.path.exists(sys.argv[1]):
        print("No argument or file not found")
        sys.exit(1)

    mainwin = RemoveWindow(sys.argv[1])
    Gtk.main()
