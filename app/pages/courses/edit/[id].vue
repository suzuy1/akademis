<template>
  <div>
    <h1>Edit Course</h1>
    <form @submit.prevent="updateCourse">
      <input v-model="course.kode" placeholder="Kode" />
      <input v-model="course.nama" placeholder="Nama" />
      <input v-model="course.sks" type="number" placeholder="SKS" />
      <button type="submit">Update Course</button>
    </form>
  </div>
</template>

<script setup>
import { useRouter, useRoute } from 'vue-router';

const supabase = useSupabaseClient()
const router = useRouter()
const route = useRoute()
const course = ref({
  kode: '',
  nama: '',
  sks: null
})

const getCourse = async () => {
  const { data, error } = await supabase.from('courses').select('*').eq('id', route.params.id).single()
  if (error) {
    console.error(error)
  } else {
    course.value = data
  }
}

const updateCourse = async () => {
  const { data, error } = await supabase.from('courses').update(course.value).eq('id', route.params.id)
  if (error) {
    console.error(error)
  } else {
    router.push('/courses')
  }
}

getCourse()
</script>
