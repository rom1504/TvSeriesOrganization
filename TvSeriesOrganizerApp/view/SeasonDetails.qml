import QtQuick 2.0
import "qrc:/GeneralQmlItems/"

TabPage
{
    id:seasonDetails
    imageSource:season.banner
    property int episodeIndex:0
    property var seriesModel
    property var season
    property var seasonIndex
    onTabChanged: stackview.get(1).seasonIndex=column
    onCurrentTabChanged:seasonDetails.imageSource=currentItem.myData.banner;
    tabContentModel: seriesModel
    property int listBeginIndex:episodeIndex
    property bool upcoming:false


    onBack:stackview.pop({immediate:true})


    function episodeClicked(episodeNumber,upcoming,season)
    {
        episodeIndex=episodeNumber
        stackview.push
        ({
           item:"qrc:/view/EpisodeDetails.qml",
           immediate:true,
           properties:
           {
               episodeIndex:seasonDetails.episodeIndex,
               episode:season.getEpisode(episodeNumber),
               seasonModel:upcoming ? season.seasonUpcomingModel : season.seasonModel,
               upcoming:upcoming
           }
        })
    }

    tabContentDelegate:
        ListView
        {
            property variant myData:season
            delegate:Episode{onEpisodeClicked:seasonDetails.episodeClicked(index,upcoming,season)}
            model:upcoming ? season.seasonUpcomingModel : season.seasonModel
            width: seasonDetails.width-40
            height: parent.height
            currentIndex: listBeginIndex
            highlightRangeMode:ListView.StrictlyEnforceRange
            id:listview
            Keys.onDownPressed: listview.incrementCurrentIndex()
            Keys.onUpPressed: listview.decrementCurrentIndex()
            Keys.onReturnPressed:currentItem.Keys.onReturnPressed(event)
        }
    tabDelegate:TabItem{tabText:qsTr("Season")+" "+season.number;tabPage:seasonDetails}

    beginIndex:seasonIndex
}
