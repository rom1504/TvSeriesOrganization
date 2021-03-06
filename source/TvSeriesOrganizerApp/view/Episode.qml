import QtQuick 2.0
import "qrc:/GeneralQmlItems/"

ShadowBorderRectangleButton
{
    signal episodeClicked(int index)

    Keys.onReturnPressed: episodeClicked(index)
    onClicked:
    {
        if(isMouseIn(seenRectangle,50)) seenRectangle.clicked()
        else episodeClicked(index)
    }

    onPressedChanged:
    {
        if(!pressed || isMouseIn(seenRectangle,50)) seenRectangle.pressed=pressed
        if(!(pressed && isMouseIn(seenRectangle,50))) rectColor=pressed ? "#EEEEEE" : "white"
    }
    TitleImageDescriptionItem
    {
        title:episode.name
        imageSource:episode.banner.small
        description:qsTr("Episode number")+" "+episode.number+"\n"+(episode.aired ? qsTr("First aired") : qsTr("Will be aired"))+": "+Qt.formatDateTime(episode.firstAired, "yyyy-MM-dd")+"\n"+episode.overview
        maximumDescriptionHeight: 115
        width:parent.width-10
    }
    SeenIndicator
    {
        id:seenRectangle
        seen:episode.seen
        onSeenHasChanged:episode.seen=seenRectangle.seen
        x:parent.width-width-5
    }
}
