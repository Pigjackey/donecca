<template>
  <v-container>
    <v-row>
      <v-col cols="12" sm="6" offset-sm="3">
        <v-card>
          <v-dialog
            v-model="dialog"
            width="500"
          >
            <v-card>
              <v-img
                :src="`https://pigjackey.imfast.io/${n}.jpg`"
                class="grey lighten-2"
              />
            </v-card>
          </v-dialog>
          <v-container fluid>
            <v-row>
              <v-col
                v-for="n in 23"
                :key="n"
                class="d-flex child-flex"
                cols="4"
              >
                <v-card flat tile class="d-flex">
                  <v-img
                    :src="`https://pigjackey.imfast.io/square/${n}.jpg`"
                    :lazy-src="`https://picsum.photos/10/6?image=${n * 5 + 10}`"
                    aspect-ratio="1"
                    class="grey lighten-2"
                    @click="clickImage(n)"
                  >
                    <template v-slot:placeholder>
                      <v-row
                        class="fill-height ma-0"
                        align="center"
                        justify="center"
                      >
                        <v-progress-circular indeterminate color="grey lighten-5"></v-progress-circular>
                      </v-row>
                    </template>
                  </v-img>
                </v-card>
              </v-col>
            </v-row>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    name: 'Media',

    data: () => ({
      showImage: false,
      dialog: false,
      n : null
    }),
    methods: {
      clickImage (val) {
        this.dialog = true
        this.n = val
      }
    }
  }
</script>
