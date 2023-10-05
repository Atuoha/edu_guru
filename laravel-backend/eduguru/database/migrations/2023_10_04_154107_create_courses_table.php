<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->string('user_token');
            $table->string('title',150);
            $table->smallInteger('type_id');
            $table->string('thumbnail',150);
            $table->text('description',150);
            $table->string('video',150)->nullable();
            $table->smallInteger('video_length')->nullable();
            $table->float('price');
            $table->float('score')->nullable();
            $table->smallInteger('follow')->nullable();
            $table->smallInteger('lesson_num')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('courses');
    }
};
