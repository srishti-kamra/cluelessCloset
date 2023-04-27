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
        
        ZStack {
            Image("wallpaper")
                .ignoresSafeArea()
            
                        VStack {
                Text("No outfits? As if!")
                    .font(.largeTitle)
                    .bold()
                    
                   Text("We suggest making an album in your camera roll of your clothes to quicken the process of planning your outfits.")
                    .font(.system(size: 14))
                    .bold()
                    .background(Color.white)
                
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
                        ActionSheet(title: Text("Uploading Photos"), message: Text("Please click on the button to access your photo library"), buttons: [ ActionSheet.Button.default(Text("Photo Library"), action: {
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
                        ActionSheet(title: Text("Uploading Photo"), message: Text("Please click on the button to access your photo library"), buttons: [ ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker2 = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                        
                    }
            }
        }
        
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
