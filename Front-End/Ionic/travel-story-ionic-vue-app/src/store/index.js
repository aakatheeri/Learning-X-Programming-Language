import { createStore } from 'vuex';

export const store = createStore({
     state() {
          return {
               stories: [{
                         id: 1,
                         title: 'Impressive Trip',
                         description: 'This was a amazing trip!',
                         city: 'Amsterdam',
                         pictureURL: 'https://www.travelanddestinations.com/wp-content/uploads/2020/05/People-in-a-car-off-on-a-trip.jpg'
                    },
                    {
                         id: 2,
                         title: 'Vegans In',
                         description: 'A round trip on Las Vegas!',
                         city: 'Las Vigas',
                         pictureURL: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/90/b1/d5/las-vegas-welcome-sign.jpg?w=1000&h=600&s=1'
                    },
                    {
                         id: 3,
                         title: 'Romantic Place',
                         description: 'Feeling romantic all day in this trip!',
                         city: 'Malaga',
                         pictureURL: 'https://spanishsabores.com/wp-content/uploads/2015/08/Sunset-Gibralfaro.jpg'
                    },
                    {
                         id: 4,
                         title: 'Nature and mountains',
                         description: 'Never see the a cold nature and beautiful trip like this!',
                         city: 'Zurich',
                         pictureURL: 'https://www.planetware.com/wpimages/2020/06/switzerland-zurich-to-rhine-falls-3-ways-to-get-there-by-tour.jpg'
               }]
          }
     },
     getters: {
          getCurrentStories (state) {
               return state.stories;
          },
          getSelectedStory(state) {
               return (id) => {
                    return state.stories.find((story) => story.id === id);
               };
          },
          getNumberOfVisitedCities (state) {
               let uniqueCities = new Set();

               const listOfCities = state.stories.filter((story) => {
                    if(!uniqueCities.has(story.city)) {
                         uniqueCities.add(story.city)
                         return story;
                    }
               });

               return listOfCities.length;
          }
     }
})
