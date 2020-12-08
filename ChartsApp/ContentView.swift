//
//  ContentView.swift
//  ChartsApp
//
//  Created by Hasan Ali Şişeci on 8.12.2020.
//
import SwiftUI
import SwiftUICharts
struct ContentView: View {
    @State var tabIndex:Int = 0
    var body: some View {
        //Bir tab oluşturalım
        TabView(selection: $tabIndex) {
            BarCharts().tabItem { Group{
                    Image(systemName: "chart.bar")
                    Text("Bar charts")
                }}.tag(0)
            LineCharts().tabItem { Group{
                    Image(systemName: "waveform.path.ecg")
                    Text("Line charts")
                }}.tag(1)
            PieCharts().tabItem { Group{
                    Image(systemName: "chart.pie")
                    Text("Pie charts")
                }}.tag(2)
            LineChartsFull().tabItem { Group{
                Image(systemName: "waveform.path.ecg")
                Text("Full Screen Line Charts")
            }}.tag(3)
        }
    }
}

struct BarCharts:View {
    var body: some View {
        VStack{
            //Grafiğimize tanımlamak için bir chartStyle hazırlıyoruz.
                        let chartStyle = ChartStyle(
                            //Arka plan rengi belirledik.
                            backgroundColor: Color.black,
                            //Sütunların gradient şeklinde renklenmesi için başlangıç ve bitiş renkleri belirliyoruz.
                            accentColor:Colors.OrangeStart,
                            secondGradientColor: Colors.OrangeEnd,
                            //Grafik Başlığının yazı rengini belirledik
                            textColor: Color.white,
                            //Sütunların isimlerini gösterecek olan yazının rengini belirliyoruz.
                            legendTextColor: Colors.OrangeStart,
                            //Grafik arka planı için gölge rengi belirliyoruz.
                            dropShadowColor: Colors.OrangeStart)
                        
                        //Bu sefer grafiğimize daha fazla veri ekleyelim.
                        BarChartView(data: ChartData(values:[
                            ("Turkey",32137),
                            ("Germany",12332),
                            ("UK",14718),
                            ("France",3411),
                            ("Russia", 28142)]),
                            title: "December 7 Covid Cases",
                            style: chartStyle, form: ChartForm.extraLarge)
        }
    }
}

struct LineCharts:View {
    var body: some View {
        VStack(alignment: .center, spacing: 50, content: {
                    //Çizgi grafiğimizi oluşturalım.
                    LineChartView(data: [30110,31923,32381,32736,31896,30402,32137],
                                  title: "Covid Cases in Turkey",
                                  legend: "Last 7 Days",
                                  form: ChartForm.extraLarge)
                    //Farklı veri setleri ile bir çizgi grafiği oluşturup aralarındaki ilişkiyi görmek istersek
                    MultiLineChartView(data: [
                                        ([30110,31923,32381,32736,31896,30402,32137], GradientColors.green),
                                        ([13429,16170,14878,16298,15539,17271,14718], GradientColors.purple),
                                        ([13604,17270,22046,23449,23318,17767,12332], GradientColors.orange)],
                                        title: "TR-UK-DEU",
                                        legend: "green-purple-orange",
                                        form: ChartForm.extraLarge)
                })
    }
}

struct PieCharts:View {
    var body: some View {
        VStack{
            PieChartView(data: [8,23,54,32,12,37,7,23,43], title: "Pie Chart")
        }
    }
}

struct LineChartsFull: View {
    var body: some View {
        VStack{
            LineView(data: [30110,31923,32381,32736,31896,30402,32137],
                     title: "Covid Cases in Turkey", legend: "Last 7 Days").padding()
            // legend is optional, use optional .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
