using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Score as Score;

class PlayDelegate extends Ui.InputDelegate {
    function initialize() {
        InputDelegate.initialize();
    }

    function onTap(evt) {
        pushView();
    }

    function onKey(evt) {
        if (evt.getKey() == Ui.KEY_ENTER) {
            pushView();
        }
    }

    function pushView() {
        Ui.pushView(new GameView(), new GameDelegate(), Ui.SLIDE_IMMEDIATE);
    }
}

class PlayView extends Ui.View {
    function initialize() {
        View.initialize();
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLUE);
        dc.clear();

        var height = dc.getHeight();
        var width = dc.getWidth();

        dc.drawText(width / 2, height / 2 - dc.getFontHeight(Gfx.FONT_LARGE),
            Gfx.FONT_LARGE, "2048", Gfx.TEXT_JUSTIFY_CENTER);

        dc.drawText(width / 2, height / 2,
            Gfx.FONT_SMALL, "High Score: " + Score.getHighScore(), Gfx.TEXT_JUSTIFY_CENTER);
    }
}
