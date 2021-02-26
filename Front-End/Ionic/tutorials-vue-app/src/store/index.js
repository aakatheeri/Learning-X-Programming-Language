import { createStore } from 'vuex';

const store = createStore({
     state() {
          return {
               lessons: [{
                         id: 1,
                         title: 'Category 1',
                         sessions: [
                              {
                                   id: 1,
                                   title: 'Session One',
                                   description: 'Quid duis duis illum.',
                                   content: [
                                        `
                                        <h2>First tutorial on this session</h2>
                                        <p>Quem legam cillum culpa summis cillum irure velit fugiat enim illum dolore dolor
                                        fore enim nisi sint malis tamen enim.</p>
                                        <p>Sint sint fugiat dolore illum quorum aute eram dolor quorum dolore amet fore
                                        malis aute minim tamen minim legam aliqua quae sunt elit aliqua fugiat tempor
                                        export aliqua illum nisi culpa dolor multos anim dolore.</p>
                                        <img src="assets/tutorials-images/IMG_0008.JPG">
                                        `,
                                        `
                                        <h2>Second tutorial</h2>
                                        <p>Dolor quid quem duis culpa sint quis noster duis nulla noster aliqua malis 
                                        multos malis fugiat quid eram illum quis enim quae tamen nulla labore legam
                                        ipsum aliqua elit amet.</p>
                                        <p>Fugiat quem fore quae dolor minim aliqua nulla noster minim amet esse sint
                                        noster fore enim fore quorum sunt aute minim quem quae irure aliqua cillum amet
                                        dolore enim labore aliqua noster quem irure noster nulla enim tamen elit amet.</p>
                                        `
                                   ]
                              },
                              {
                                   id: 2,
                                   title: 'Session Two',
                                   description: 'Nulla nisi eram labore quae.',
                                   content: [
                                        `
                                        <h2>The second session!</h2>
                                        <p>Commodo quo duis deserunt, ut duis ut veniam, iis fugiat exquisitaque est amet
                                        occaecat ab arbitrantur, admodum et appellat quo non ut cohaerescant ad tamen o
                                        senserit qui nulla, voluptate culpa anim iis quorum.M</p> <p>Excepteur fore fugiat an
                                        quis hic ad duis relinqueret se eram hic ab veniam ullamco, fugiat litteris
                                        probant, ipsum hic offendit quo nulla ea senserit quae ubi appellat graviterque
                                        se elit ullamco o praesentibus, esse incurreret reprehenderit.</p>
                                        <p>Cupidatat velit
                                        eu fabulas philosophari, anim ne eiusmod si non et firmissimum et in an sunt
                                        tamen ipsum.Incididunt ubi aliquip e quis eiusmod ab noster quorum an a iis
                                        multos voluptate non multos ex senserit. Ea labore export ad quamquam an amet</p>
                                        <p>Ita do multos incididunt ne aliquip ut enim deserunt, eu nulla hic dolor si
                                        nostrud minim quamquam laboris de cernantur non vidisse, minim vidisse a
                                        sempiternum, ad arbitror domesticarum. Elit laboris graviterque ab si esse velit
                                        hic probant a cillum eiusmod ab praesentibus iis ipsum eu ne elit senserit.</p>
                                        `,
                                        'Content 2'
                                   ]
                              },
                              {
                                   id: 3,
                                   title: 'Session Three',
                                   description: 'Quem noster quem anim amet.',
                                   content: '<p>Some Content</p>'
                              },
                              {
                                   id: 4,
                                   title: 'Session Four',
                                   description: 'Tempor ipsum dolor velit fore.',
                                   content: '<p>Some Content</p>'
                              },
                              {
                                   id: 4,
                                   title: 'Session Five',
                                   description: 'Velit quorum dolore enim enim sint.',
                                   content: '<p>Some Content</p>'
                              }
                         ]
               }] // end of Lessons

          }
     },
     getters: {
          getCurrentLessons(state) {
               return state.lessons;
          },
          getCurrentSession(state) {

               return (lesson_id, session_id) => {
                    return state.lessons[lesson_id-1].sessions[session_id-1];
               };
          }
     }
});

export default store;
