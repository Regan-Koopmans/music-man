package music_man

import (
"fmt"
"log"

"github.com/jroimartin/gocui"
)


func keybindings(g *gocui.Gui) error {

	if err := g.SetKeybinding("", gocui.KeyCtrlC, gocui.ModNone, quit); err != nil {
		log.Panicln(err)
	}
	return nil
}

func main() {
	g, err := gocui.NewGui(gocui.OutputNormal)
	if err != nil {
		log.Panicln(err)
	}
	defer g.Close()

	g.SetManagerFunc(layout)
	if err := keybindings(g); err != nil {
		log.Panicln(err)
	}


	if err := g.MainLoop(); err != nil && err != gocui.ErrQuit {
		log.Panicln(err)
	}
}

func layout(g *gocui.Gui) error {
	maxX, maxY := g.Size()
	if v, err := g.SetView("hello", maxX/2-8, maxY/2, maxX/2+9, maxY/2+2); err != nil {
		if err != gocui.ErrUnknownView {
			return err
		}

		fmt.Fprintln(v, "Music Man v0.0.1")

	}
	return nil
}

func handleEnter(gui *gocui.Gui, view *gocui.View) {

}

func quit(g *gocui.Gui, v *gocui.View) error {
	return gocui.ErrQuit
}