import SwiftUI

struct SliderView<Page: View>: View {
    
    @State var viewControllers: [UIHostingController<Page>]
    
    @Binding var currentPage: Int
    
    public init(views: [Page], current: Binding<Int>) {
        self._viewControllers = State(initialValue: views.map { UIHostingController(rootView: $0) })
        self._currentPage = current
        print("'rerender'")
    }
    
    var body: some View {
        VStack {
            
            
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    print(currentPage)
                    print("total pages: \(self.viewControllers.count)")
                })
                .navigationBarTitle("")
                .navigationBarHidden(true)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.bottom, 20)
            
        }
        .onAppear() {
            print("hello")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}


