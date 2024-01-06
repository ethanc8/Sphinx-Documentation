// const ECDarkModeCheckbox =document.getElementById('ECDarkModeCheckbox')

// console.log(ECDarkModeCheckbox);

// ECDarkModeCheckbox.addEventListener('click',ECDetermineColorScheme)

// function ECDetermineColorScheme(){
//     if(ECDarkModeCheckbox.checked) {
//         document.body.classList.add('dark-mode')
//     } else {
//         document.body.classList.remove('dark-mode')
//     }
// }

function ECSetColorScheme(colorScheme) {
    if (colorScheme === "light") {
        document.body.classList.remove('dark-mode')
        document.body.classList.add('light-mode')
    } else {
        document.body.classList.remove('light-mode')
        document.body.classList.add('dark-mode')
    }
}
