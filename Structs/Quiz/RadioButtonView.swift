import SwiftUI


//MARK:- Single Radio Button Field
struct RadioButtonField: View {
    let id: Int
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let selected:Bool
    let setAnswer: (Int)->()
    
    init(
        id: Int,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        selected: Bool,
        setAnswer: @escaping (Int)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.selected = selected
        self.setAnswer = setAnswer
    }
    
    var body: some View {
        Button(action:{
            self.setAnswer(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selected ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}
