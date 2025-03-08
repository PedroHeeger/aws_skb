cat << 'EOF' > src/main/java/KinesisProducer.java
import software.amazon.awssdk.core.SdkBytes;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.kinesis.KinesisClient;
import software.amazon.awssdk.services.kinesis.model.PutRecordRequest;
import software.amazon.awssdk.services.kinesis.model.PutRecordResponse;

public class KinesisProducer {
    public static void main(String[] args) {
        KinesisClient client = KinesisClient.builder()
                .region(Region.US_WEST_2) // Change to your region
                .build();

        while (true) {
            try {
                String data = "Test data " + System.currentTimeMillis();
                PutRecordRequest request = PutRecordRequest.builder()
                        .streamName("Lab-Stream")
                        .partitionKey("partition-1")
                        .data(SdkBytes.fromUtf8String(data))
                        .build();

                PutRecordResponse response = client.putRecord(request);
                System.out.println("Successfully put record, sequence number: " + 
                        response.sequenceNumber());

                Thread.sleep(1000); // Wait 1 second between records
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
            }
        }
    }
}
EOF