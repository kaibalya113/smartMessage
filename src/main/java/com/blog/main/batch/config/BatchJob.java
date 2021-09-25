package com.blog.main.batch.config;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecutionListener;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.LineMapper;
import org.springframework.batch.item.file.mapping.BeanWrapperFieldSetMapper;
import org.springframework.batch.item.file.mapping.DefaultLineMapper;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;

import com.blog.main.batch.process.SpringBatchJobCompletionListener;
import com.blog.main.model.Contact;



@Configuration
@EnableBatchProcessing
public class BatchJob {
	
	@Bean
	public Job job(JobBuilderFactory builderFactory,
				StepBuilderFactory stepBuilderFactory,
				ItemReader<Contact> itemReader,			
                ItemProcessor<Contact, Contact> itemProcessor,
                ItemWriter<Contact> itemWriter) {
		
		Step step = stepBuilderFactory.get("ETL-STEP-BATCH")
					.<Contact, Contact>chunk(100)
					.reader(itemReader)
					.processor(itemProcessor)
					.writer(itemWriter)
					.build();
		
		return builderFactory.get("ETL-BATCH")
				.incrementer(new RunIdIncrementer())
				.start(step)
				.build();
		
	}
	
	// here create itemReader file, That will read csv file
	// here we will use FlatFileItemReader to read csv file
	@Bean
	public FlatFileItemReader<Contact> itemreader(){
		
		FlatFileItemReader<Contact> flatFileItemReader = new FlatFileItemReader<>();
		flatFileItemReader.setResource(new FileSystemResource("/users/krishna/Documents/user12.csv"));
		flatFileItemReader.setName("CSV-Reader");												// setting up name for reader
        flatFileItemReader.setLinesToSkip(1);													// it will skip 1st line becasuse 1st line of csv is header
        flatFileItemReader.setLineMapper(lineMapper());											// mapping the csv data to pojo
        return flatFileItemReader;
		
	}

	@Bean
    public LineMapper<Contact> lineMapper() {												// It will convert csv file to pojo

        DefaultLineMapper<Contact> defaultLineMapper = new DefaultLineMapper<>();			// can accept values of type user
        DelimitedLineTokenizer lineTokenizer = new DelimitedLineTokenizer();			// 

        lineTokenizer.setDelimiter(",");
        lineTokenizer.setStrict(false);
        lineTokenizer.setNames("id", "name", "dept", "salary");

        BeanWrapperFieldSetMapper<Contact> fieldSetMapper = new BeanWrapperFieldSetMapper<>();
        fieldSetMapper.setTargetType(Contact.class);

        defaultLineMapper.setLineTokenizer(lineTokenizer);
        defaultLineMapper.setFieldSetMapper(fieldSetMapper);

        return defaultLineMapper;
    }
	
	@Bean
    public JobExecutionListener listener() {
        return new SpringBatchJobCompletionListener();
    }

}
