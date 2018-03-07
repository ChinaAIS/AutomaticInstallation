from distutils.core import setup
import py2exe
import sys

sys.argv.append('py2exe')

py2exe_options = {
    "compressed": 1,
    "optimize": 2,
    "ascii": 0,
}

setup(
        name='ConfiguringFirewallWithLAS',
        version='0.1',
        windows=[{'script': 'BA10ConfiguringCommands\AutomaticUnschedule.py', 'icon_resources': []}],
        data_files=[("",
                   [r"BA10ConfiguringCommands\Source\AutoItX3.dll"]),
                    ("",
                   [r"BA10ConfiguringCommands\Source\Centralink.lnk"])],
        zipfile=None,
        options={'py2exe': py2exe_options}
)
