import SwiftUI

struct SecondView: View {
    
    @State private var image1: Image? = Image("")
    @State private var image2: Image? = Image("")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentImagePicker2 = false
    @State private var shouldPresentActionSheet = false
    @State private var shouldPresentActionSheet2 = false
    @State private var shouldPresentCamera = false
    
    var body: some View {
        
        VStack {
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .bold()
                .background(Color.pink)
            
            
            
            
            // Top photo
            
            image1!
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height:250)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.pink.opacity(
                    0.5), lineWidth: 2))
                .shadow(radius: 5)
            
            //Button that takes you to either camera roll or camera
                .onTapGesture { self.shouldPresentActionSheet = true }
                .sheet(isPresented: $shouldPresentImagePicker) {
                    SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image1, isPresented: self.$shouldPresentImagePicker)
                }.actionSheet(isPresented: $shouldPresentActionSheet) { () -> ActionSheet in
                    ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = true
                    }), ActionSheet.Button.default(Text("Photo Library"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = false
                    }), ActionSheet.Button.cancel()])
                    
                }
            
            
            //Bottom photo
            image2!
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height:250)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.pink.opacity(
                    0.5), lineWidth: 2))
                .shadow(radius: 5)
            
            
            
            //Button that takes you to either camera roll or camera
                .onTapGesture { self.shouldPresentActionSheet2 = true }
                .sheet(isPresented: $shouldPresentImagePicker2) {
                    SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image2, isPresented: self.$shouldPresentImagePicker2)
                }.actionSheet(isPresented: $shouldPresentActionSheet2) { () -> ActionSheet in
                    ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                        self.shouldPresentImagePicker2 = true
                        self.shouldPresentCamera = true
                    }), ActionSheet.Button.default(Text("Photo Library"), action: {
                        self.shouldPresentImagePicker2 = true
                        self.shouldPresentCamera = false
                    }), ActionSheet.Button.cancel()])
                    
                }
            
        }
        
        
    }
     
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
