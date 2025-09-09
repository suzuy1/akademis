<template>
  <div>
    <h1>Add New Course</h1>
    <form @submit.prevent="addCourse">
      <input v-model="course.kode" placeholder="Kode" />
      <input v-model="course.nama" placeholder="Nama" />
      <input v-model="course.sks" type="number" placeholder="SKS" />
      <button type="submit">Add Course</button>
    </form>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';

const supabase = useSupabaseClient()
const router = useRouter()
const course = ref({
  kode: '',
  nama: '',
  sks: null
})

const addCourse = async () => {
  const { data, error } = await supabase.from('courses').insert([course.value])
  if (error) {
    console.error(error)
  } else {
    router.push('/courses')
  }
}
</script>
