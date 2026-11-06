
import subprocess

from gi.repository import GObject, Nautilus


class OpenInVSCode(GObject.GObject, Nautilus.MenuProvider):

    def open_vscode(self, menu, files):
        paths = []

        for file in files:
            location = file.get_location()
            path = location.get_path() if location else None

            if path:
                paths.append(path)

        if paths:
            subprocess.Popen(["code", *paths])

    def get_file_items(self, files):
        if not files:
            return []

        # 只支持本地文件和目录
        if any(file.get_uri_scheme() != "file" for file in files):
            return []

        item = Nautilus.MenuItem(
            name="OpenInVSCode::Files",
            label="使用 VS Code 打开",
            tip="使用 VS Code 打开选中的文件或文件夹",
        )

        item.connect("activate", self.open_vscode, list(files))

        return [item]

    def get_background_items(self, current_folder):
        if current_folder.get_uri_scheme() != "file":
            return []

        item = Nautilus.MenuItem(
            name="OpenInVSCode::Background",
            label="使用 VS Code 打开",
            tip="使用 VS Code 打开当前目录",
        )

        item.connect(
            "activate",
            self.open_vscode,
            [current_folder],
        )

        return [item]
