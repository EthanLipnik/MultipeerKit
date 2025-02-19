import Foundation
import MultipeerConnectivity.MCPeerID

final class MockMultipeerConnection: MultipeerProtocol {

    let localPeer: Peer = {
        let underlyingPeer = MCPeerID(displayName: "MockPeer")
        return try! Peer(peer: underlyingPeer, discoveryInfo: nil)
    }()

    var didReceiveData: ((Data, Peer) -> Void)?
    var didReceiveFile: ((URL, Peer) -> Void)?
    var didFindPeer: ((Peer) -> Void)?
    var didLosePeer: ((Peer) -> Void)?
    var didConnectToPeer: ((Peer) -> Void)?
    var didDisconnectFromPeer: ((Peer) -> Void)?
    
    var isRunning = false

    func resume() {
        isRunning = true
    }

    func stop() {
        isRunning = false
    }

    func broadcast(_ data: Data, mode: MCSessionSendDataMode = .reliable) throws {
        didReceiveData?(data, localPeer)
    }

    func send(_ data: Data, to peers: [Peer], mode: MCSessionSendDataMode = .reliable) throws {
        
    }
    
    func send(_ url: URL, withName name: String = "temp", to peer: Peer, mode: MCSessionSendDataMode = .reliable) {
        
    }

    func invite(_ peer: Peer, with context: Data?, timeout: TimeInterval, completion: InvitationCompletionHandler?) {
        
    }
    
    func getLocalPeer() -> Peer? {
        return localPeer
    }

}
