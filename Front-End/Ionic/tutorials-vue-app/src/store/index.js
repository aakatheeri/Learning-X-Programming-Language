import { createStore } from 'vuex';

const store = createStore({
     state() {
          return {
               lessons: [{
                         id: 1,
                         title: 'Lesson 1',
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
                                        `,
                                        `
                                        <h2>Thrid tutorial</h2>
                                        <p>Esse fore aliqua quid quis labore amet esse duis tamen quis sunt nulla multos
                                        anim velit nisi duis summis quis ipsum eram illum legam summis enim elit sint
                                        velit cillum enim labore quem tamen summis fore quorum duis sint irure aliqua
                                        quae quae quis tempor quae dolor nisi fore tempor</p>
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
                                        `
                                        <h2>Check another tutorial!</h2>
                                        <p>Anim tempor legam anim magna esse summis amet elit culpa fugiat cillum fugiat
                                        sunt minim anim nulla dolore amet dolor labore labore dolore veniam fugiat culpa
                                        labore eram tamen labore velit quorum dolore quis dolor aliqua summis veniam
                                        quid veniam aute quis culpa sint minim velit magna tamen culpa tamen.</p>
                                        <p>Aliqua quis minim duis dolor magna quis aliqua malis quid magna tamen summis
                                        labore cillum nulla summis velit magna amet irure minim duis nisi irure.</p>
                                        `
                                   ]
                              },
                              {
                                   id: 3,
                                   title: 'Session Three',
                                   description: 'Quem noster quem anim amet.',
                                   content: [
                                        `
                                        <h2>One of the tutorials should be appeared here</h2>

                                        <p>
                                             Nisi esse aute illum quae sint tamen velit dolor tamen fore summis duis multos
                                             legam ipsum summis tempor ipsum anim quid malis quem tempor multos cillum legam
                                             multos sint quid velit aliqua eram dolor elit legam quid irure illum multos.
                                        </p>

                                        <p>
                                             Sunt summis velit legam tempor eram fore aliqua tamen quem malis legam duis
                                             minim labore labore tamen duis anim fugiat labore aute culpa multos legam legam
                                             anim nisi tempor cillum amet malis malis irure aliqua nulla fore tamen aliqua
                                             velit sint illum labore illum sint.
                                        </p>
                                        `,
                                        `
                                        <h2>Next tutorial please!</h2>

                                        <p>
                                             Export minim noster sunt enim culpa nisi irure fore quae fore fugiat dolore
                                             veniam sint nisi ipsum elit nulla tempor minim summis labore nulla export dolore
                                             quid sint labore aute duis esse dolore labore fugiat fore magna fore aute dolor
                                             cillum illum malis magna anim illum irure labore tamen quis.
                                        </p>

                                        <div class="terminal_view">
                                             <p>Device :~ cd /new/path/</p>
                                        </div>

                                        <p>
                                             Fore quorum tempor amet aliqua aute quorum summis aliqua esse malis fugiat
                                             noster fugiat fore velit nisi nisi noster eram.
                                        </p>
                                        `
                                   ]
                              },
                              {
                                   id: 4,
                                   title: 'Session Four',
                                   description: 'Tempor ipsum dolor velit fore.',
                                   content: [
                                        `
                                        <h2>Make more tutorials</h2>

                                        <p></p>

                                        <p>Eu duis aliqua eu laboris an ab velit voluptate possumus. Tamen nescius ullamco.
                                        Ita aliqua export nisi iudicem, qui dolore magna an quamquam, aliquip dolor ut
                                        nostrud philosophari sed excepteur ita quibusdam si offendit si dolore vidisse,
                                        anim ea arbitror ea summis, sed velit.</p>

                                        <p>Legam in cupidatat de e quid non fugiat. Tempor ullamco e philosophari.Nam veniam sint in consequat. Illum ne ab elit
                                        appellat, possumus eu aliquip. Esse te quamquam do labore.</p>
                                        `,
                                        `
                                        <h2>Another tutorial!</h2>

                                        <p>Summis ullamco id elit quae ab de quorum e aliqua, non vidisse transferrem, et
                                        anim pariatur, deserunt quem iudicem arbitror, mentitum hic quem quibusdam,
                                        ullamco minim doctrina voluptate.</p>

                                        <p>Offendit export enim ubi irure. Eu cillum quo
                                        elit. Ea magna commodo consequat, laborum sunt senserit non ex quis arbitror
                                        commodo o minim ita incurreret.Velit admodum in nulla malis. Non eram
                                        philosophari e ne ita exquisitaque. Arbitror quid illum laborum quem do et duis
                                        ullamco adipisicing, de esse officia, se aliquip graviterque.</p>
                                        `
                                   ]
                              },
                              {
                                   id: 5,
                                   title: 'Session Five',
                                   description: 'Velit quorum dolore enim enim sint.',
                                   content: [
                                        `
                                        <h2>The last episode</h2>

                                        <p>Ubi quorum deserunt exercitation. Probant ubi cernantur, minim exercitation
                                        expetendis legam proident, quae singulis ita comprehenderit, nescius sint ipsum
                                        doctrina quid. Ab fabulas iis doctrina, quis aliquip ne transferrem et tamen
                                        exquisitaque incididunt fugiat commodo.

                                        <p>Id quid eram qui nescius, et officia iis eiusmod a eiusmod iis summis, nisi nescius aut mentitum id te voluptate tractavissent.Vidisse sed vidisse, te summis iis multos, quamquam eram commodo
                                        cupidatat, ut culpa fore nulla consequat est minim ea excepteur, culpa
                                        incididunt laborum, culpa incididunt se senserit aut multos instituendarum
                                        cupidatat irure deserunt. Sunt est ab irure admodum, aliquip irure amet
                                        voluptate veniam. Malis iis eiusmod.</p>
                                        `
                                   ]
                              }]
                    },
                    {
                         id: 2,
                         title: 'Lesson 2',
                         sessions: [{
                              id: 1,
                              title: 'Session One',
                              description: 'Eram anim enim minim veniam.',
                              content: [
                                   `
                                   <h2>First tut from lesson 2</h2>

                                   <p>Velit minim dolor duis culpa enim anim quid aliqua velit nulla quis fore dolore
                                   eram legam quid amet esse fugiat quae quorum tamen aliqua fore esse esse illum
                                   quorum culpa esse nisi noster tempor quis sunt aute elit esse culpa</p>

                                   <p>Minim irure quid aute elit nulla tamen dolore esse elit ipsum sunt export aliqua
                                   cillum quorum nulla sunt ipsum esse minim fugiat fore cillum aute</p>
                                   `,
                                   `
                                   <h1>2nd tut from lesson 2</h1>

                                   <p>Tamen summis elit quid quid elit noster tempor nulla illum quorum noster magna
                                   magna enim nulla quae tamen aute culpa</p>

                                   <p>Legam quorum cillum fore quem sunt labore quid veniam multos aliqua noster
                                   veniam quorum amet quid nulla quis elit dolor esse minim labore</p>
                                   `
                              ]
                         },
                         {
                              id: 2,
                              title: 'Session Two',
                              description: 'Fugiat cillum duis export aliqua.',
                              content: [
                                   `
                                   <h2>First tut from lesson 2</h2>

                                   <p>Velit minim dolor duis culpa enim anim quid aliqua velit nulla quis fore dolore
                                   eram legam quid amet esse fugiat quae quorum tamen aliqua fore esse esse illum
                                   quorum culpa esse nisi noster tempor quis sunt aute elit esse culpa</p>

                                   <p>Minim irure quid aute elit nulla tamen dolore esse elit ipsum sunt export aliqua
                                   cillum quorum nulla sunt ipsum esse minim fugiat fore cillum aute</p>
                                   `,
                              ]
                         }]

                    },
                    {
                         id: 3,
                         title: 'Lesson 3',
                         sessions: [{
                              id: 1,
                              title: 'Session One',
                              description: 'Eram anim enim minim veniam.',
                              content: [
                                   `
                                   <h2>First tut from lesson 2</h2>

                                   <p>Velit minim dolor duis culpa enim anim quid aliqua velit nulla quis fore dolore
                                   eram legam quid amet esse fugiat quae quorum tamen aliqua fore esse esse illum
                                   quorum culpa esse nisi noster tempor quis sunt aute elit esse culpa</p>

                                   <p>Minim irure quid aute elit nulla tamen dolore esse elit ipsum sunt export aliqua
                                   cillum quorum nulla sunt ipsum esse minim fugiat fore cillum aute</p>
                                   `,
                                   `
                                   <h1>2nd tut from lesson 2</h1>

                                   <p>Tamen summis elit quid quid elit noster tempor nulla illum quorum noster magna
                                   magna enim nulla quae tamen aute culpa</p>

                                   <p>Legam quorum cillum fore quem sunt labore quid veniam multos aliqua noster
                                   veniam quorum amet quid nulla quis elit dolor esse minim labore</p>
                                   `
                              ]
                         },
                         {
                              id: 2,
                              title: 'Session Two',
                              description: 'Fugiat cillum duis export aliqua.',
                              content: [
                                   `
                                   <h2>First tut from lesson 2</h2>

                                   <p>Velit minim dolor duis culpa enim anim quid aliqua velit nulla quis fore dolore
                                   eram legam quid amet esse fugiat quae quorum tamen aliqua fore esse esse illum
                                   quorum culpa esse nisi noster tempor quis sunt aute elit esse culpa</p>

                                   <p>Minim irure quid aute elit nulla tamen dolore esse elit ipsum sunt export aliqua
                                   cillum quorum nulla sunt ipsum esse minim fugiat fore cillum aute</p>
                                   `,
                              ]
                         }]

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
          },
          getLessonLength(state) {

               return (lesson_id) => {
                    return state.lessons[lesson_id-1].sessions.length;
               }

          }
     }
});

export default store;
