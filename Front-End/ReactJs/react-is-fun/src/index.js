import React from 'react'
import { render } from 'react-dom'
import Library from './Library'

let bookList = [
          {"title": "The Sun Also Rises", "author": "Ernest Heningway"},
          {"title": "Python: The right way to learn", "author": "Jack Eres", "pages": 120},
          {"title": "Unique Character", "author": "Ahmed Alkatheeri", "pages": 150},
          {"title": "Don't Make Me Think!", "author": "Someone", "pages": 130}
]

/*
class FavorateColorForm extends React.Component {
     state = { value: '' }
     newColor = e => {
          this.setState({ value: e.target.value })
     }
     submit = e => {
          console.log(`New Color: ${this.state.value}`)
          e.preventDefault()
     }
     render() {
          return (
               <form onSubmit={this.submit}>
                    <label>Favorite Color:
                         <input
                              type="color"
                              onChange={this.newColor} />
                    </label>
                    <button>Submit</button>
               </form>
          )
     }
}
*/

render(
     <Library books={bookList} />,
     document.getElementById('root')
)
