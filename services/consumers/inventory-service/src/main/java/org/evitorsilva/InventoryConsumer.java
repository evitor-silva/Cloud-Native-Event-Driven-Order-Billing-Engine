package org.evitorsilva;

import jakarta.enterprise.context.ApplicationScoped;
import org.eclipse.microprofile.reactive.messaging.Incoming;   

@ApplicationScoped
public class InventoryConsumer {
    @Incoming("inventory-topic")
    public void consumirMensagem(String payload) {
        System.out.println("Recebido: " + payload);
    }
}
